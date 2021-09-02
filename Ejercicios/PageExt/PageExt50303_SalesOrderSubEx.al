// Ejercicio 5
pageextension 50303 "Sales Order Subform Exercicies" extends "Sales Order Subform"
{
    layout
    {
        modify(Quantity)
        {
            trigger OnAfterValidate()
            var
                Ejercicio5: Codeunit 50300;
            begin
                Ejercicio5.calcQuant(Rec);
            end;
        }
    }
}