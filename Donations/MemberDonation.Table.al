table 50000 "Member Donation"
{
    DataClassification = CustomerContent;
    CaptionML = ENU = 'Member Donation', ESP = 'Donación Socios';

    fields
    {
        field(10; "Customer No."; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Customer No.', ESP = 'Nº cliente';
            TableRelation = Customer;

            trigger OnValidate()
            var
                Customer: Record Customer;
            begin
                if "Customer No." = '' then
                    "Cust. Bank Acc. Code" := ''
                else begin
                    Customer.Get("Customer No.");
                    if Customer."Customer Type" <> Customer."Customer Type"::Member then
                        Error(text001, Customer."Customer Type"::Member);
                end;
                "Cust. Bank Acc. Code" := Customer."Preferred Bank Account Code";
            end;
        }
        field(20; "Customer Name"; Text[100])
        {
            CaptionML = ENU = 'Customer Name', ESP = 'Nombre Cliente';
            FieldClass = FlowField;
            CalcFormula = Lookup(Customer.Name WHERE("No." = FIELD("Customer No.")));
            Editable = false;
        }
        field(30; "VAT Registration No."; Text[20])
        {
            CaptionML = ENU = 'VAT Registration No.', ESP = 'CIF/NIF';
            FieldClass = FlowField;
            CalcFormula = Lookup(Customer."VAT Registration No." WHERE("No." = FIELD("Customer No.")));
            Editable = false;
        }
        field(40; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Start Date', ESP = 'Fecha Inicio';

            trigger OnValidate()
            begin
                "Start Year" := Date2DMY("Start Date", 3);
            end;
        }
        field(50; "Start Year"; Integer)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Start Year', ESP = 'Año Inicio';
        }
        field(60; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'End Date', ESP = 'Fecha Baja';
        }
        field(70; "Cust. Bank Acc. Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Cust. Bank Acc. Code', ESP = 'Cód. banco cliente';
            TableRelation = "Customer Bank Account".Code WHERE("Customer No." = FIELD("Customer No."));
        }
        field(80; "Periodicity"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Monthly,Quarterly,Annual;
            OptionCaptionML = ENU = ' ,Monthly,Quarterly,Annual', ESP = ' ,Mensual,Trismestral,Anual';

            trigger OnValidate()
            begin
                CalcTotalAnnual();
            end;
        }
        field(90; "Donation Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Donation Amount', ESP = 'Importe Donación';

            trigger OnValidate()
            begin
                CalcTotalAnnual();
            end;
        }
        field(100; "Annual Total Donation"; Decimal)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Annual Total Donation', ESP = 'Total Anual Donación';
        }
    }

    keys
    {
        key(PK; "Customer No.", "Start Date")
        {
            Clustered = true;
        }
    }

    var
        text001: TextConst ESP = 'Sólo se pueden crear donaciones para los clientes del tipo %1',
        ENU = 'Donatons can only be created for customers of type %1';

    local procedure CalcTotalAnnual()
    begin
        case Periodicity of
            ' ':
                "Annual Total Donation" := "Donation Amount" * 0;
            Periodicity::Monthly:
                "Annual Total Donation" := "Donation Amount" * 12;
            Periodicity::Quarterly:
                "Annual Total Donation" := "Donation Amount" * 4;
            Periodicity::Annual:
                "Annual Total Donation" := "Donation Amount" * 1;
        end;
    end;

}