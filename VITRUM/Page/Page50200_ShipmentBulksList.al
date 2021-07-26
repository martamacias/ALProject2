page 50200 "Shipment Bulks List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Shipment Bulks";
    CaptionML = ENU = 'Shipment Bulks', ESP = 'Bultos Expedición';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(OrderN; Rec."Order No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica el valor del campo Order No..';
                    Editable = false;
                }
                field(BulkN; Rec."Bulk No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica el valor del campo Bulk No..';
                }
                field(BulkWeight; Rec."Bulk Weight")
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica el valor del campo Bulk Weight.';
                }
                field(BulkContent; Rec."Bulk Content")
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica el valor del campo Bulk Content.';
                }
                field(ShipmentN; Rec."Shipment No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica el valor del campo Shipment No..';
                    Editable = false;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if Sales.Get() then begin
            Rec."Order No." := Sales."No.";
            Rec.Modify();
        end;
    end;

    var
        Sales: Record "Sales Header";
}