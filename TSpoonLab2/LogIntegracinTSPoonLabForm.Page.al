page 50102 "Log Integración TSPoonLab Form"
{
    PageType = Document;
    SourceTable = "Log integración TSpoonLab";

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
            part("Detalle Log"; "Log integ. TSPoonLab Subform")
            {
                Enabled = Rec."Código petición" <> '';
                SubPageLink = "No. movimiento" = FIELD("No. movimiento");
                UpdatePropagation = Both;
            }
        }
    }

}