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
        modify(Post)
        {
            trigger OnAfterAction()
            var
                bulks: Record "Shipment Bulks";

            begin
                bulks.Init();
                bulks.SetFilter("Order No.", Rec."No.");
                if bulks.FindSet() then
                    repeat
                        bulks."Shipment No." := Rec."Last Shipping No.";
                        bulks.Modify(true);
                    until bulks.Next() = 0;
            end;
        }
    }
}