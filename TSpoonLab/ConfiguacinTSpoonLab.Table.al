table 50100 "Configuación TSpoonLab"
{
    DataClassification = CustomerContent;

    fields
    {
        field(10; PK; Code[1])
        {
            DataClassification = ToBeClassified;
            Description = 'Clave primaria';

        }
        field(20; "Url API"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Url Método Login"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(40; "Url Método Centros Coste"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50; "Url Método Obtener Albaranes"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(60; "Url Método Procesar Albaranes"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70; "Usuario"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(80; "Password"; Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Texto enmascarado';
            ExtendedDatatype = Masked;
        }
        field(90; "Producto Genérico"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Relacionado con la tabla Producto';
            TableRelation = Item."No."; //where (Blocked=CONST(false));
        }
        field(100; "Dimensión CENTROS"; Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'Relacionado con la tabla Dimensiones';
            TableRelation = Dimension.Code;
        }
    }

    keys
    {
        key(PK; PK)
        {
            Clustered = true;
        }
    }

}