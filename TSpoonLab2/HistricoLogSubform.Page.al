page 50106 "Histórico Log Subform"
{
    Caption = 'Líneas';
    Editable = false;
    PageType = ListPart;
    SourceTable = "Histórico detalle log";

    layout
    {
        area(Content)
        {
            repeater(Group1)
            {
                field("No. movimiento"; Rec."No. movimiento") { }
                field("No. Línea"; Rec."No. Línea") { }
                field(Código; Rec.Código) { }
                field(Descripción; Rec.Descripción) { }
                field(Cantidad; Rec.Cantidad) { }
                field(Precio; Rec.Precio) { }
                field(Estado; Rec.Estado) { }
                field("Mensaje error"; Rec."Mensaje error") { }
            }
        }
    }
}