// Ejercicio 6
tableextension 50301 "Item Exercises" extends Item
{
    fields
    {
        field(50300; PalletType; Code[10])
        {
            TableRelation = "Pallet Type";
            CaptionML = ENU = 'Pallet Type', ESP = 'Tipo de Palet';
        }
    }
}