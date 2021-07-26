pageextension 50202 ItemListExtension extends "Item List"
{
    layout
    {
        addafter(InventoryField)
        {
            field("Qty. Available"; TotalAvailable)
            {
                CaptionML = ESP = 'Cantidad disponible', ENU = 'Quantity Available';
                ToolTip = 'Especifica el valor del campo QtyAvailable.';
                Editable = false;
                ApplicationArea = Basic, Suite;
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        ItemAvailability: Codeunit "Item Availability";
    begin
        TotalAvailable := ItemAvailability.CalcAvailableQty(Rec);
    end;

    var
        TotalAvailable: Decimal;
}