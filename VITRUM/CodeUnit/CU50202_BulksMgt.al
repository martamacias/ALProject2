codeunit 50202 BulksMgt
{
    procedure SetShipmentNo(var Rec: Record "Sales Header")
    var
        bulks: Record "Shipment Bulks";

    begin
        Message(Rec."No.");
        Message(Rec."Last Shipping No.");

        bulks.Init();
        bulks.SetFilter("Order No.", Rec."No.");
        Message(bulks."Order No.");

        bulks."Shipment No." := Rec."Last Shipping No.";
        bulks.Modify(true);
    end;
}