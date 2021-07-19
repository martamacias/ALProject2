page 50105 "Histórico Log Form"
{
    PageType = Document;
    Editable = false;
    SourceTable = "Histórico Log";
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            group(Cabecera)
            {
                field("No. movimiento"; Rec."No. movimiento")
                {
                    ToolTip = 'No. movimiento';
                }
                field("Tipo petición"; Rec."Tipo petición")
                {
                    ToolTip = 'Tipo petición';
                }
                field("Código petición"; Rec."Código petición")
                {
                    ToolTip = 'Código petición';
                }
                field(Estado; Rec.Estado)
                {
                    ToolTip = 'Estado';
                }
                field("Mensaje error"; Rec."Mensaje error")
                {
                    ToolTip = 'Mensaje error';
                }
                field("JSON Respuesta"; Rec."JSON Respuesta")
                {
                    ToolTip = 'JSON Respuesta';
                }
                field("Fecha petición"; Rec."Fecha petición")
                {
                    ToolTip = 'Fecha petición';
                }
                field("Hora petición"; Rec."Hora petición")
                {
                    ToolTip = 'Hora petición';
                }
                field("Fecha inicio"; Rec."Fecha inicio")
                {
                    ToolTip = 'Fecha inicio';
                }
                field("Fecha fin"; Rec."Fecha fin")
                {
                    ToolTip = 'Fecha fin';
                }
                field(Codi; Rec.Codi)
                {
                    ToolTip = 'Codi';
                }
                field(codeVendor; Rec.codeVendor)
                {
                    ToolTip = 'Código del vendedor';
                }
                field(deliveryNum; Rec.deliveryNum)
                {
                    ToolTip = 'Número de envío';
                }
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