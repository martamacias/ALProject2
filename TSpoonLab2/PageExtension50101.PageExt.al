pageextension 50101 PageExtension50101 extends "Order Processor Role Center"
{
    actions
    {
        addlast(sections)
        {
            group(TSpoonLab)
            {
                action("Configuración TSL")
                {
                    RunObject = page "Configuación TSpoonLab";
                    ApplicationArea = All;
                }
                action("Log Integración")
                {
                    RunObject = page "Log Integración TSpoonLab List";
                    ApplicationArea = All;
                }
                action("Traspasar Log a Histórico")
                {
                    RunObject = report "Traspasar Log a Histórico";
                    ApplicationArea = All;
                }
                action("Histórico Log")
                {
                    RunObject = page "Histórico Log List";
                    ApplicationArea = All;
                }
            }
        }
    }

    var
        myInt: Integer;
}