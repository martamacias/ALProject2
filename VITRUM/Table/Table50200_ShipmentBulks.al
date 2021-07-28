table 50200 "Shipment Bulks"
{
    DataClassification = CustomerContent;
    CaptionML = ENU = 'Shipment Bulks', ESP = 'Bultos Expedicion';

    fields
    {
        field(10; "Order No."; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Order No.', ESP = 'Nº pedido';
        }
        field(20; "Bulk No."; Integer)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Bulk No.', ESP = 'Nº bulto';
        }
        field(30; "Bulk Content"; Text[100])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Bulk Content', ESP = 'Contenido';
        }
        field(40; "Bulk Weight"; Decimal)
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Bulk Weight', ESP = 'Peso bulto';
        }
        field(50; "Shipment No."; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ENU = 'Shipment No.', ESP = 'Nº albarán';
        }
    }

    keys
    {
        key(Key1; "Order No.", "Bulk No.")
        {
            Clustered = true;
        }
        key(Key2; "Shipment No.") { }
    }

    trigger OnDelete()
    begin
        if Rec."Shipment No." <> '' then
            Error('No se puede eliminar el registro porque contiene el número de albarán');
    end;
}