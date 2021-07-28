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
                Image = "Invoicing-MDL-PreviewDoc";
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
        }
    }

    var
    //myInt: Integer;
}