// Ejercicio 5
pageextension 50302 "Customer Card Execises" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field(InventoryWarning; Rec.InventoryWarning)
            {
                ApplicationArea = All;
                ToolTip = 'Especifica el valor del campo InventoryWarning.';
            }
        }
    }
}