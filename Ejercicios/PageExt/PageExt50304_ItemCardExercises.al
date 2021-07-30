// Ejercicio 6
pageextension 50304 "Item Card Exercises" extends "Item Card"
{
    layout
    {
        addlast(Item)
        {
            field(PalletType; Rec.PalletType)
            {
                ApplicationArea = All;
                ToolTip = 'Especifica el valor del campo PalletType.';
            }
        }
    }
}