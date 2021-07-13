table 50103 "Histórico Log"
{
    DataClassification = CustomerContent;

    fields
    {
        field(10; "No. movimiento"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'PK';
        }
        field(20; "Tipo petición"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Login,Centro coste,Obtener albarán,Procesar albarán';
            OptionMembers = Login,"Centro coste","Obtener albarán","Procesar albarán";
        }
        field(30; "Código petición"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(40; Estado; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Creado,Procesado,Error';
            OptionMembers = Creado,Procesado,Error;
        }
        field(50; "Mensaje error"; Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(60; "JSON Respuesta"; Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(70; "Fecha petición"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(80; "Hora petición"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(90; "Fecha inicio"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(100; "Fecha fin"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(110; Codi; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(120; codeVendor; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(130; deliveryNum; Text[35])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "No. movimiento")
        {
            Clustered = true;
        }
    }
}