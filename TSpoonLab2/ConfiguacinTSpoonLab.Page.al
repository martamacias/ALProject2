page 50100 "Configuación TSpoonLab"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Configuación TSpoonLab";
    RefreshOnActivate = true;
    InsertAllowed = false;
    DeleteAllowed = false;
    SaveValues = true;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Url API"; Rec."Url API")
                {
                    ToolTip = 'Type here...';
                    ApplicationArea = All;
                    ExtendedDatatype = URL;
                }
                field(Usuario; Rec.Usuario)
                {
                    ApplicationArea = All;
                }
                field(Password; Rec.Password)
                {
                    ApplicationArea = All;
                }
                field("Producto Genérico"; Rec."Producto Genérico")
                {
                    ApplicationArea = All;
                }
                field("Dimensión CENTROS"; Rec."Dimensión CENTROS")
                {
                    ApplicationArea = All;
                }
            }
            group(Métodos)
            {
                field("Url Método Login"; Rec."Url Método Login")
                {
                    ApplicationArea = All;
                }
                field("Url Método Centros Coste"; Rec."Url Método Centros Coste")
                {
                    ApplicationArea = All;
                }
                field("Url Método Obtener Albaranes"; Rec."Url Método Obtener Albaranes")
                {
                    ApplicationArea = All;
                }
                field("Url Método Procesar Albaranes"; Rec."Url Método Procesar Albaranes")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnOpenPage()
    BEGIN
        Rec.RESET;
        IF NOT Rec.GET THEN BEGIN
            Rec.INIT;
            Rec.INSERT;
        END;
    END;
}