codeunit 50201 "Item Availability"
{
    procedure CalcAvailableQty(var Item: Record Item) TotalAvailable: Decimal
    begin
        Item.CalcFields(Inventory, "Qty. on Sales Order", "Qty. on Purch. Order", "Qty. on Assembly Order");
        TotalAvailable := (Item.Inventory - Item."Qty. on Sales Order" + Item."Qty. on Purch. Order" + Item."Qty. on Assembly Order");
    end;
}