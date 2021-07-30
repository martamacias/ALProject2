// Ejercicio 1
// Ejercicio 6
pageextension 50300 ItemListExt extends "Item List"
{
    layout
    {
        addlast(content)
        {
            field(PalletType; Rec.PalletType) // Ejercicio 6
            {
                ApplicationArea = All;
                ToolTip = 'Especifica el valor del campo PalletType.';
            }
        }
    }

    actions
    {
        addlast(Item)
        {
            action(InventoryButton) // Ejercicio 1
            {
                CaptionML = ENU = 'Available Inventory', ESP = 'Inventario Disponible';
                Image = Inventory;
                ToolTip = 'Ejecuta la acción InventoryButton:';
                trigger OnAction()
                begin
                    if Rec.Inventory = 0 then
                        Error(text002)
                    else
                        Message(text001, Rec.Inventory);
                end;
            }
        }
    }

    var
        text001: TextConst ENU = 'The available inventory is %1', ESP = 'El inventario disponible es %1';
        text002: TextConst ENU = 'Error: No inventory!', ESP = 'Error: No hay inventario!';
}