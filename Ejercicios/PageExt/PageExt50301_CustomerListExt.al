// Ejercicio 2
pageextension 50301 CustomerLstExt extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addlast("&Customer")
        {
            action(LastInvoice)
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
            action(Last3Invoices)
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

                begin
                    invtable.Init();
                    invtable.SetFilter("Sell-to Customer No.", Rec."No.");
                    invtable.SetAscending("No.", false);

                    num := 0;
                    if invtable.FindFirst() then begin
                        repeat
                            invtable.Mark(true);
                            invtable.Next();
                            num := num + 1;
                        until (num = 3) or (invtable.Next() = 0);
                        if num = 3 then begin

                            invtable.MarkedOnly(true);
                            invtable.FindSet();
                            invoices.SetTableView(invtable);
                            //invoices.SetRecord(invtable);
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

    var
    //myInt: Integer;
}