report 50100 "Report Clientes"
{
    CaptionML = ENU = 'Customer report', ESP = 'Reporte de clientes';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = Basic;
    DefaultLayout = RDLC;
    RDLCLayout = './ReportClientesLayout.rdl';

    dataset
    {
        dataitem(Customer; Customer)
        {
            column(No_; "No.")
            {

            }
            column(Name; Name)
            { }
            column(Search_Name; "Search Name")
            { }

            trigger OnAfterGetRecord()
            begin
                Name := NameToUpperCase(Name);
                "Search Name" := ValidSearchName("Search Name");
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(ShowSearchName; ShowSearchName)
                    {
                        CaptionML = ENU = 'Show search name', ESP = 'Mostrar Alias';
                    }
                }
            }
        }
    }
    // función para poner en mayúsculas el nombre
    local procedure NameToUpperCase(TheName: Text): Text
    begin
        exit(UpperCase(TheName))
    end;

    local procedure ValidSearchName(SName: Text): Text
    begin
        if ShowSearchName = true then
            SName := SName
        else
            SName := '';
    end;

    // si quiere mostrar el alias o no, opción de la request page
    var
        ShowSearchName: Boolean;
}