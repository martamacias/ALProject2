report 50000 "Generate Donation Bills"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    CaptionML = ENU = 'Generate Donation Bills', ESP = 'Generar Efectos Donaciones';
    ProcessingOnly = true;

    dataset
    {
        dataitem(Customer; Customer)
        {
            DataItemTableView = WHERE("Customer Type" = CONST(Member));
            dataitem("Member Donation"; "Member Donation")
            {
                DataItemLink = "Customer No." = field("No.");

                trigger OnPreDataItem()
                begin
                    ReferenceDate := DMY2DATE(1, MonthOfDonation + 1, YearOfDonation);
                    "Member Donation".SETFILTER("Start Date", '..%1', ReferenceDate);
                    "Member Donation".SETFILTER("End Date", '%1|%2..', 0D, ReferenceDate);
                end;

                trigger OnAfterGetRecord()
                var
                    CustomerPostingGroup: Record "Customer Posting Group";
                begin
                    IF DonationIsDue("Member Donation", ReferenceDate) THEN BEGIN
                        // Generar línea en el diario general
                        GenJournalLine.INIT();
                        GenJournalLine."Journal Template Name" := GenJnlLine."Journal Template Name";
                        GenJournalLine."Journal Batch Name" := GenJnlLine."Journal Batch Name";
                        //rellenar los valores del diario por defecto
                        //número línea
                        LineNo := LineNo + 10000;
                        GenJournalLine."Line No." := LineNo;
                        //para que se inserten campos autom. se pone validate (OnValidate)
                        GenJournalLine.SetHideValidation(TRUE);
                        GenJournalLine.VALIDATE("Posting Date", PostingDate);
                        GenJournalLine.VALIDATE("Document Type", GenJnlLine."Document Type"::Bill);//tipo efecto
                        GenJournalLine.VALIDATE("Bill No.", '1');
                        GenJournalLine.VALIDATE("Document No.", DocNo);
                        GenJournalLine.VALIDATE("Account Type", GenJnlLine."Account Type"::Customer);//mov. cliente
                        GenJournalLine.VALIDATE("Account No.", "Member Donation"."Customer No.");
                        GenJournalLine.VALIDATE("Debit Amount", "Member Donation"."Donation Amount");//importe debe

                        //contrapartida
                        GenJournalLine.VALIDATE("Bal. Account Type", GenJnlLine."Bal. Account Type"::"G/L Account");
                        Customer.GET("Member Donation"."Customer No.");
                        CustomerPostingGroup.GET(Customer."Customer Posting Group");
                        GenJournalLine.VALIDATE("Bal. Account No.", CustomerPostingGroup."Service Charge Acc.");

                        GenJournalLine.INSERT(TRUE);
                    END;
                end;
            }
        }
    }

    requestpage
    {
        SaveValues = false;
        layout
        {
            area(Content)
            {
                group(General)
                {
                    field("Month of donation"; MonthOfDonation)
                    {
                        ApplicationArea = All;
                        CaptionML = ENU = 'Month Of Donation', ESP = 'Mes Donación';
                        OptionCaptionML = ENU = 'January,February,March,April,May,June,July,August,September,October,November,December', ESP = 'Enero,Febrero,Marzo,Abril,Mayo,Junio,Julio,Agosto,Septiembre,Octubre,Noviembre,Diciembre';
                        ToolTip = 'Especifica el valor del campo MonthOfDonation.';

                        trigger OnValidate()
                        begin
                            PostingDate := DMY2DATE(1, MonthOfDonation + 1, YearOfDonation);
                        end;
                    }
                    field("Year of donation"; YearOfDonation)
                    {
                        ApplicationArea = All;
                        CaptionML = ENU = 'Year of Donation', ESP = 'Año Donación';
                        ToolTip = 'Especifica el valor del campo YearOfDonation.';

                        trigger OnValidate()
                        begin
                            PostingDate := DMY2DATE(1, MonthOfDonation + 1, YearOfDonation);
                        end;
                    }
                    field("Posting date"; PostingDate)
                    {
                        ApplicationArea = All;
                        CaptionML = ENU = 'Posting Date', ESP = 'Fecha Registro';
                        ToolTip = 'Especifica el valor del campo PostingDate.';
                    }
                    field(GenJournalTemplate; GenJnlLine."Journal Template Name")
                    {
                        ApplicationArea = All;
                        CaptionML = ENU = 'Gen. Journal Template', ESP = 'Libro del diario general';
                        TableRelation = "Gen. Journal Template";
                        ToolTip = 'Especifica el valor del campo Journal Template Name.';

                        trigger OnValidate()
                        begin
                            GenJnlLine."Journal Batch Name" := '';
                            DocNo := '';
                        end;
                    }
                    field(GenJournalBatch; GenJnlLine."Journal Batch Name")
                    {
                        ApplicationArea = All;
                        CaptionML = ENU = 'Gen. Journal Batch', ESP = 'Sección diario general';
                        Lookup = true;
                        ToolTip = 'Especifica el valor del campo Journal Batch Name.';

                        trigger OnValidate()
                        begin
                            IF GenJnlLine."Journal Batch Name" <> '' THEN BEGIN
                                GenJnlLine.TESTFIELD("Journal Template Name");
                                GenJnlBatch.GET(GenJnlLine."Journal Template Name", GenJnlLine."Journal Batch Name");
                            END;
                            ValidateJnl();
                        end;

                        trigger OnLookup(var Text: Text): Boolean
                        begin
                            GenJnlLine.TESTFIELD("Journal Template Name");
                            GenJnlTemplate.GET(GenJnlLine."Journal Template Name");
                            GenJnlBatch.FILTERGROUP(2);
                            GenJnlBatch.SETRANGE("Journal Template Name", GenJnlLine."Journal Template Name");
                            GenJnlBatch.FILTERGROUP(0);
                            GenJnlBatch."Journal Template Name" := GenJnlLine."Journal Template Name";
                            GenJnlBatch.Name := GenJnlLine."Journal Batch Name";
                            IF PAGE.RUNMODAL(0, GenJnlBatch) = ACTION::LookupOK THEN BEGIN
                                Text := GenJnlBatch.Name;
                                EXIT(TRUE);
                            END;
                        end;
                    }
                    field(DocumentNo; DocNo)
                    {
                        ApplicationArea = All;
                        CaptionML = ENU = 'Document No.', ESP = 'Nº documento';
                        ToolTip = 'Especifica el valor del campo DocNo.';
                    }
                }
            }
        }

        trigger OnOpenPage()
        begin
            MonthOfDonation := DATE2DMY(WORKDATE(), 2) - 1;
            YearOfDonation := DATE2DMY(WORKDATE(), 3);
            // fecha de registro desde primer dia del mes
            PostingDate := DMY2DATE(1, MonthOfDonation + 1, YearOfDonation);
        end;

        local procedure ValidateJnl()
        begin
            DocNo := '';
            IF GenJnlBatch.GET(GenJnlLine."Journal Template Name", GenJnlLine."Journal Batch Name") THEN
                IF GenJnlBatch."No. Series" <> '' THEN
                    DocNo := NoSeriesMgt.TryGetNextNo(GenJnlBatch."No. Series", PostingDate);
        end;


    }
    local procedure DonationIsDue(MemberDonation: Record "Member Donation"; RefDate: Date): Boolean
    begin
        CASE MemberDonation.Periodicity OF
            MemberDonation.Periodicity::" ":
                EXIT(FALSE);
            MemberDonation.Periodicity::Monthly:
                EXIT(TRUE);
            MemberDonation.Periodicity::Quarterly:
                //casos en los que le toca (mes), cada 3 meses según fecha inicio y fecha de referencia:
                CASE DATE2DMY(MemberDonation."Start Date", 2) OF
                    1, 4, 7, 10:
                        EXIT(DATE2DMY(RefDate, 2) IN [1, 4, 7, 10]);
                    2, 5, 8, 11:
                        EXIT(DATE2DMY(RefDate, 2) IN [2, 5, 8, 11]);
                    3, 6, 9, 12:
                        EXIT(DATE2DMY(RefDate, 2) IN [3, 6, 9, 12]);
                END;
            MemberDonation.Periodicity::Annual:
                //si el mes de la fecha de inicio es igual al mes de la fecha de referencia:
                EXIT(DATE2DMY(MemberDonation."Start Date", 2) = DATE2DMY(ReferenceDate, 2));
        end;
    end;

    trigger OnPreReport()
    begin
        IF YearOfDonation = 0 THEN
            ERROR(Text003);

        IF PostingDate = 0D THEN
            ERROR(Text004);

        GenJournalLine.SETRANGE("Journal Template Name", GenJnlLine."Journal Template Name");
        GenJournalLine.SETRANGE("Journal Batch Name", GenJnlLine."Journal Batch Name");
        IF GenJournalLine.FINDLAST() THEN
            LineNo := GenJournalLine."Line No."
        ELSE
            LineNo := 0;
    end;

    var
        GenJnlLine: Record "Gen. Journal Line";
        GenJnlBatch: Record "Gen. Journal Batch";
        GenJnlTemplate: Record "Gen. Journal Template";
        GenJournalLine: Record "Gen. Journal Line";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        MonthOfDonation: Option January,February,March,April,May,June,July,August,September,October,November,December;
        YearOfDonation: Integer;
        PostingDate: Date;
        ReferenceDate: Date;
        DocNo: Code[20];
        LineNo: Integer;
        Text003: TextConst ENU = 'A year must be specified', ESP = 'Debe especificar un año';
        Text004: TextConst ENU = 'A posting date must be specified', ESP = 'Debe especificar una fecha registro';
}