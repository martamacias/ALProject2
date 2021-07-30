page 50200 "Shipment Bulks List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Shipment Bulks";
    CaptionML = ENU = 'Shipment Bulks', ESP = 'Bultos Expedición';
    SaveValues = true;
    Editable = true;
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
    var
        g_boolEditable: Boolean;

    trigger OnOpenPage()
    begin
        CurrPage.Editable(g_boolEditable);
    end;

    procedure seteditable()
    begin
        g_boolEditable := true
    end;
}