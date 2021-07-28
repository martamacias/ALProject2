tableextension 50201 SalesOrderExt extends "Sales Header"
{
    trigger OnDelete()
    var
        bulks: Record "Shipment Bulks";

    begin
        bulks.Init();
        bulks.SetFilter("Order No.", Rec."No.");
        if bulks.FindSet() then
            if (bulks."Shipment No." = '') then begin
                Message('Los bultos con el Nº pedido %1 se eliminarán', Rec."No.");
                bulks.DeleteAll();
            end;
    end;
}