page 50105 "Histórico Log Form"
{
    PageType = Document;
    Editable = false;
    SourceTable = "Histórico Log";

    layout
    {
        area(Content)
        {
            group(Cabecera)
            {
                field("No. movimiento"; Rec."No. movimiento") { }
                field("Tipo petición"; Rec."Tipo petición") { }
                field("Código petición"; Rec."Código petición") { }
                field(Estado; Rec.Estado) { }
                field("Mensaje error"; Rec."Mensaje error") { }
                field("JSON Respuesta"; Rec."JSON Respuesta") { }
                field("Fecha petición"; Rec."Fecha petición") { }
                field("Hora petición"; Rec."Hora petición") { }
                field("Fecha inicio"; Rec."Fecha inicio") { }
                field("Fecha fin"; Rec."Fecha fin") { }
                field(Codi; Rec.Codi) { }
                field(codeVendor; Rec.codeVendor) { }
                field(deliveryNum; Rec.deliveryNum) { }
            }
            part("Detalle Histórico Log"; "Histórico Log Subform")
            {
                Editable = false;
                Enabled = Rec."Código petición" <> '';
                SubPageLink = "No. movimiento" = FIELD("No. movimiento");
                UpdatePropagation = Both;
            }
        }
    }

}