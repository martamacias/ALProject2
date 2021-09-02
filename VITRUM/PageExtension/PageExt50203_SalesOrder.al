pageextension 50203 "Sales Order Ext" extends "Sales Order"
{
    actions
    {
        addlast(Processing)
        {
            action(Bulks)
            {
                CaptionML = ENU = 'Bulks', ESP = 'Bultos';
                ToolTip = 'Ejecuta la acción Bulks:';
                Image = SKU;

                trigger OnAction()
                var
                    tbulks: Record "Shipment Bulks";
                    pbulks: Page "Shipment Bulks List";

                begin
                    tbulks.Init();
                    tbulks.SetFilter("Order No.", Rec."No.");
                    pbulks.SetTableView(tbulks);
                    pbulks.seteditable();
                    pbulks.Run();
                end;
            }
        }
    }
}