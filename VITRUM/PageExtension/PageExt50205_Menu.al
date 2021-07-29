pageextension 50205 MenuExt extends "Order Processor Role Center"
{
    actions
    {
        addlast(Action76)
        {
            action(Bulks)
            {
                CaptionML = ENU = 'Bulks', ESP = 'Bultos';
                RunObject = Page "Shipment Bulks List";
                RunPageMode = View;
                ToolTip = 'Ejecuta la acción Bulks:';
            }
        }
    }
}