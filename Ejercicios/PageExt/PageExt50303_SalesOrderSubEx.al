// Ejercicio 5
pageextension 50303 "Sales Order Subform Exercicies" extends "Sales Order Subform"
{
    layout
    {
        modify(Quantity)
        {
            trigger OnAfterValidate()
            var
                tcust: Record Customer;
                titem: Record Item;
                total: Decimal;
                text001: TextConst ENU = 'Product inventory %1: %2', ESP = 'Inventario producto %1: %2';
            begin
                tcust.Init();
                tcust.SetFilter("No.", Rec."Sell-to Customer No.");
                tcust.FindFirst();
                if tcust.InventoryWarning then begin
                    titem.Init();
                    titem.SetFilter("No.", Rec."No.");
                    if titem.FindFirst() then begin
                        Message('%1', titem.Inventory);
                        total := (titem.Inventory - Rec.Quantity);
                        Message(text001, titem."No.", total);
                    end;
                end;
            end;
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}