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
                    ToolTip = 'Especifica la url usada para la API.';
                    ApplicationArea = All;
                    ExtendedDatatype = URL;
                }
                field(Usuario; Rec.Usuario)
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica el email usuario.';
                }
                field(Password; Rec.Password)
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica la contraseña del usuario.';
                }
                field("Producto Genérico"; Rec."Producto Genérico")
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica el producto.';
                }
                field("Dimensión CENTROS"; Rec."Dimensión CENTROS")
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica la dimensión.';
                }
            }
            group(Métodos)
            {
                field("Url Método Login"; Rec."Url Método Login")
                {
                    ApplicationArea = All;
                    ToolTip = 'Url usada para el Método del login';
                }
                field("Url Método Centros Coste"; Rec."Url Método Centros Coste")
                {
                    ApplicationArea = All;
                    ToolTip = 'Url usada para el Método centros coste';
                }
                field("Url Método Obtener Albaranes"; Rec."Url Método Obtener Albaranes")
                {
                    ApplicationArea = All;
                    ToolTip = 'Url usada para el Método de obtener albaranes';
                }
                field("Url Método Procesar Albaranes"; Rec."Url Método Procesar Albaranes")
                {
                    ApplicationArea = All;
                    ToolTip = 'Url usada para el Método de procesamiento de albaranes';
                }
            }
        }
    }

    trigger OnOpenPage()
    BEGIN
        Rec.RESET();
        IF NOT Rec.GET() THEN BEGIN
            Rec.INIT();
            Rec.INSERT();
        END;
    END;
}