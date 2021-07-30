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
                    titem.Get(Rec."No.");
                    titem.SetRange("No.", Rec."No.");
                    titem.CalcFields(Inventory);
                    total := (titem.Inventory - Rec.Quantity);
                    Message(text001, titem."No.", total);

                end;
            end;
        }
    }
}