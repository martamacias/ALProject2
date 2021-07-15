page 50103 "Log integ. TSPoonLab Subform"
{
    Caption = 'Líneas';
    PageType = ListPart;
    SourceTable = "Detalle log integr. TSpoonLab";

    layout
    {
        area(Content)
        {
            repeater(Group)
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

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }
}