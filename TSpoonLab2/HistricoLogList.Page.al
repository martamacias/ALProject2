page 50104 "Histórico Log List"
{
    PageType = List;
    SourceTable = "Histórico Log";
    CardPageId = "Histórico Log Form";

    layout
    {
        area(Content)
        {
            repeater(Group)
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
        }
    }
}