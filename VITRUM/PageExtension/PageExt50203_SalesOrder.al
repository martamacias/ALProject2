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
        modify(Post)
        {
            trigger OnAfterAction()
            var
                bulks: Record "Shipment Bulks";
            //cubulks: Codeunit BulksMgt;

            begin
                Message(Rec."No.");
                Message(Rec."Last Shipping No.");

                bulks.Init();
                bulks.SetFilter("Order No.", Rec."No.");
                Message(bulks."Order No.");

                bulks."Shipment No." := Rec."Last Shipping No.";
                bulks.Modify(true);
            end;
        }
    }
}