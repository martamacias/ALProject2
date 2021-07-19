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

    var
        TotalAvailable: Decimal;
}