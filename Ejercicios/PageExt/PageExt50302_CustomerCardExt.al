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
            }
        }
    }

    /*actions
    {
        // Add changes to page actions here
    }
    
    var
        myInt: Integer;*/
}