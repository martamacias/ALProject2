page 50106 "Histórico Log Subform"
{
    Caption = 'Líneas';
    Editable = false;
    PageType = ListPart;
    SourceTable = "Histórico detalle log";
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            repeater(Group1)
            {
                field("No. movimiento"; Rec."No. movimiento")
                {
                    ToolTip = 'PK';
                }
                field("No. Línea"; Rec."No. Línea")
                {
                    ToolTip = 'No. Línea';
                }
                field(Código; Rec.Código)
                {
                    ToolTip = 'Código';
                }
                field(Descripción; Rec.Descripción)
                {
                    ToolTip = 'Descripción';
                }
                field(Cantidad; Rec.Cantidad)
                {
                    ToolTip = 'Cantidad';
                }
                field(Precio; Rec.Precio)
                {
                    ToolTip = 'Precio';
                }
                field(Estado; Rec.Estado)
                {
                    ToolTip = 'Estado';
                }
                field("Mensaje error"; Rec."Mensaje error")
                {
                    ToolTip = 'Mensaje error';
                }
            }
        }
    }
}