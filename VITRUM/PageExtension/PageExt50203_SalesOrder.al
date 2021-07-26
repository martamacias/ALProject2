pageextension 50203 "Sales Order Ext" extends "Sales Order"
{
    actions
    {
        addlast(Processing)
        {
            action(Bulks)
            {
                CaptionML = ENU = 'Bulks', ESP = 'Bultos';
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Shipment Bulks List";
                RunPageLink = "Order No." = field("No.");
                ToolTip = 'Ejecuta la acción Bulks:';
                Image = SKU;
            }
        }
    }
}