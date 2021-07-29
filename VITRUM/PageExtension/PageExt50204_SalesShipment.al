pageextension 50204 SalesShipmentExt extends "Posted Sales Shipment"
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
                    tbulks.SetFilter("Shipment No.", Rec."No.");
                    tbulks.FindSet();
                    pbulks.SetTableView(tbulks);
                    pbulks.Editable(false);
                    pbulks.Run();
                end;
            }
        }
    }
}