// Ejercicio 6
page 50301 "Pallet Type List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Pallet Type";
    CaptionML = ENU = 'Pallet Type List', ESP = 'Lista Tipos de Palet';
    Editable = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Cod; Rec.Cod)
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica el valor del campo Cod.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica el valor del campo Description.';
                }
                field(ProductNo; Rec.ProductNo)
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica el valor del campo ProductNo.';
                }
            }
        }
    }
}