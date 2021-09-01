tableextension 50201 SalesOrderExt extends "Sales Header"
{
    trigger OnDelete()
    var
        bulks: Record "Shipment Bulks";

    begin
        //bulks.Init(); Innecesario
        bulks.SetFilter("Order No.", Rec."No.");
        bulks.SetFilter("Shipment No.", ''''''); //Filtro por los que no tienen nº de albarán
        if not bulks.IsEmpty() then              //La función IsEmpty te dice si un Record con filtros tiene registros o no
                                                 //sería lo mismo que if bulks.FindSet() pero por temas de rendimiento es mejor el IsEmpty cuando sólo necesitas saber si hay o no hay registros.
            if Confirm('Los bultos con el Nº pedido %1 se eliminarán. ¿Desea continuar?', true, Rec."No.") then //El confirm te muestra un mensaje y te permite cancelar.
                bulks.DeleteAll();
    end;
}