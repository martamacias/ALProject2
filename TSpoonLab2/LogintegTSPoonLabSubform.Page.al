page 50103 "Log integ. TSPoonLab Subform"
{
    Caption = 'Líneas';
    PageType = ListPart;
    SourceTable = "Detalle log integr. TSpoonLab";
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            repeater(Group)
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