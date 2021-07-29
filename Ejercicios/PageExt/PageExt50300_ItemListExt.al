// Ejercicio 1
pageextension 50300 ItemListExt extends "Item List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addlast(Item)
        {
            action(InventoryButton)
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