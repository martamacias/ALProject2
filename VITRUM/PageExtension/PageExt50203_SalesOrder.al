pageextension 50203 "Sales Order Ext" extends "Sales Order"
{
    actions
    {
        addlast(Processing)
        {
            action(Bulks)
            {
                CaptionML = ENU = 'Bulks', ESP = 'Bultos';
                RunObject = Page "Shipment Bulks List";
                RunPageLink = "Order No." = field("No.");
                ToolTip = 'Ejecuta la acción Bulks:';
                Image = SKU;
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