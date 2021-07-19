pageextension 50201 ItemCardExtension extends "Item Card"
{
    layout
    {
        addafter("Qty. on Assembly Order")
        {
            field("Qty. Available"; TotalAvailable)
            {
                CaptionML = ESP = 'Cantidad disponible', ENU = 'Quantity Available';
                ToolTip = 'Especifica el valor del campo QtyAvailable.';

            }
        }
    }

    trigger OnOpenPage()
    var
        RecordItem: Record Item;
        Codeunit1: Codeunit "Item Availability";
    begin
        TotalAvailable := Codeunit1.CalcAvailableQty(RecordItem);
    end;

    var
        TotalAvailable: Decimal;
}