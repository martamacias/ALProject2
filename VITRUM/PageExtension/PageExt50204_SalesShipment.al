pageextension 50204 SalesShipmentExt extends "Posted Sales Shipment"
{
    actions
    {
        addlast(Processing)
        {
            action(Bulks)
            {
                CaptionML = ENU = 'Bulks', ESP = 'Bultos';
                RunObject = Page "Shipment Bulks List";
                RunPageLink = "Shipment No." = field("No.");
                RunPageMode = View;
                ToolTip = 'Ejecuta la acción Bulks:';
                Image = SKU;
            }
        }
    }
}