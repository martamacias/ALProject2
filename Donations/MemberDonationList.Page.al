page 50000 "Member Donation List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Member Donation";
    CaptionML = ENU = 'Member Donation List', ESP = 'Lista Donaciones Socios';

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica el valor del campo Customer No..';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica el valor del campo Customer Name.';
                }
                field("VAT Registration No."; Rec."VAT Registration No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica el valor del campo VAT Registration No..';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica el valor del campo Start Date.';
                }
                field("Start Year"; Rec."Start Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica el valor del campo Start Year.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica el valor del campo End Date.';
                }
                field("Cust. Bank Acc. Code"; Rec."Cust. Bank Acc. Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica el valor del campo Cust. Bank Acc. Code.';
                }
                field(Periodicity; Rec.Periodicity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica el valor del campo Periodicity.';
                }
                field("Donation Amount"; Rec."Donation Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica el valor del campo Donation Amount.';
                }
                field("Annual Total Donation"; Rec."Annual Total Donation")
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica el valor del campo Annual Total Donation.';
                }
            }
        }
    }
}