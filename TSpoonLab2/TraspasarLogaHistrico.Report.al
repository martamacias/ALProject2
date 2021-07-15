report 50100 "Traspasar Log a Histórico"
{
    ProcessingOnly = true;

    dataset
    {
        dataitem("Log integración TSpoonLab"; "Log integración TSpoonLab")
        {
            dataitem("Detalle log integr. TSpoonLab"; "Detalle log integr. TSpoonLab")
            {
                DataItemLink = "No. movimiento" = FIELD("No. movimiento");

                trigger OnAfterGetRecord()
                begin
                    Históricodetallelog.INIT;
                    Históricodetallelog.TRANSFERFIELDS("Detalle log integr. TSpoonLab");
                    Históricodetallelog.INSERT(TRUE);
                end;

                trigger OnPostDataItem()
                begin
                    "Detalle log integr. TSpoonLab".DELETEALL;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                HistóricoLog.INIT;
                HistóricoLog.TRANSFERFIELDS("Log integración TSpoonLab");
                HistóricoLog.INSERT(TRUE);
            end;

            trigger OnPostDataItem()
            begin
                "Log integración TSpoonLab".DELETEALL;
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content) { }
        }

        trigger OnOpenPage()
        begin
            FechaFiltro := CalcDate('-1M', WorkDate());

            "Log integración TSpoonLab".SETFILTER(Estado, 'Error|Procesado');
            "Log integración TSpoonLab".SETFILTER("Fecha inicio", '..%1', FechaFiltro);
        end;
    }

    var
        DetallelogintegrTSpoonLab: Record "Detalle log integr. TSpoonLab";
        Históricodetallelog: Record "Histórico detalle log";
        HistóricoLog: Record "Histórico Log";
        FechaFiltro: Date;
        DiaFiltro: Integer;
        MesFiltro: Integer;
        YearFIltro: Integer;
        EstadoError: Option Creado,Procesado,Error;
        EstadoProcesado: Option Creado,Procesado,Error;
}