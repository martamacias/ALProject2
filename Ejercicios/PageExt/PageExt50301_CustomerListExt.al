// Ejercicio 2
// Ejercicio 3

pageextension 50301 CustomerListExt extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addlast("&Customer")
        {
            action(LastInvoice) // Ejercicio 2
            {
                CaptionML = ENU = 'Last Invoice', ESP = 'Última factura';
                Image = SalesInvoice;
                ToolTip = 'Ejecuta la acción LastInvoice:';

                trigger OnAction()
                var
                    invtable: Record "Sales Invoice Header";
                    invoices: Page "Posted Sales Invoice";
                    text001: TextConst ENU = 'The customer %1 has no invoices.', ESP = 'El cliente %1 no tiene facturas.';
                begin
                    invtable.Init();
                    invtable.SetFilter("Sell-to Customer No.", Rec."No.");
                    invtable.SetAscending("No.", false);
                    if invtable.FindFirst() then begin
                        invoices.SetRecord(invtable);
                        invoices.Run();
                    end
                    else
                        Error(text001, Rec."No.");
                end;
            }
            action(Last3Invoices) // Ejercicio 3
            {
                CaptionML = ENU = 'Last 3 invoices', ESP = 'Últimas 3 facturas';
                Image = JobSalesInvoice;
                ToolTip = 'Muestra las últimas 3 facturas';

                trigger OnAction()
                var
                    invtable: Record "Sales Invoice Header";
                    invoices: Page "Posted Sales Invoices";
                    text001: TextConst ENU = 'The customer %1 has no invoices.', ESP = 'El cliente %1 no tiene facturas.';
                    text002: TextConst ENU = 'The customer %1 does not have 3 invoices', ESP = 'El cliente %1 no tiene 3 facturas.';
                    num: Integer;
                    EndBucle: Boolean;
                begin
                    invtable.Init();
                    invtable.SetFilter("Sell-to Customer No.", Rec."No.");
                    invtable.SetAscending("No.", false);

                    num := 0;
                    EndBucle := false;
                    if invtable.FindSet() then begin
                        repeat
                            invtable.Mark(true);
                            num := num + 1;
                            if num <= 3 then
                                invtable.Next()
                            else
                                EndBucle := true;
                        until EndBucle;
                        if num = 3 then begin
                            invtable.MarkedOnly(true);
                            //invtable.FindSet(); Innecesario
                            invoices.SetTableView(invtable);
                            invoices.Run();
                        end
                        else
                            Error(text002, Rec."No.");
                    end
                    else
                        Error(text001, Rec."No.");
                end;
            }
        }
    }
}