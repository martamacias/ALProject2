// Ejercicio 6
table 50300 "Pallet Type"
{
    DataClassification = CustomerContent;
    CaptionML = ENU = 'Pallet Type', ESP = 'Tipo de Palet';

    fields
    {
        field(10; Cod; Code[10])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Code', ESP = 'Código';
        }
        field(20; Description; Text[50])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Description', ESP = 'Descripción';
        }
        field(30; ProductNo; Integer)
        {
            CaptionML = ENU = 'Product No.', ESP = 'Nº Productos';
            FieldClass = FlowField;
            TableRelation = Item;
            CalcFormula = count(Item where(PalletType = field(Cod)));
        }
    }

    keys
    {
        key(PK; Cod)
        {
            Clustered = true;
        }
    }
}