table 50104 "Histórico detalle log"
{
    DataClassification = CustomerContent;

    fields
    {
        field(10; "No. movimiento"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'PK, relacionado con Log integración SPoonLab';
            TableRelation = "Log integración TSpoonLab"."No. movimiento" WHERE("No. movimiento" = FIELD("No. movimiento"));
        }
        field(20; "No. Línea"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'PK';
        }
        field(30; Código; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(40; Descripción; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50; Cantidad; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(60; Precio; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 2 : 5;
            Description = 'Hasta 5 decimales';
        }
        field(70; Estado; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Creado,Procesado,Error;
        }
        field(80; "Mensaje error"; Blob)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "No. movimiento", "No. Línea")
        {
            Clustered = true;
        }
    }
}