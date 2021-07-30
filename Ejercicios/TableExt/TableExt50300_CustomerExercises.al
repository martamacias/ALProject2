// Ejercicio 4
// Ejercicio 5
tableextension 50300 "Customer Exercices" extends Customer
{
    fields
    {
        field(50300; LastInvoice; Code[20])
        {
            CaptionML = ENU = 'Last Invoice', ESP = 'Última Factura';
            FieldClass = FlowField;
            TableRelation = "Sales Invoice Header";
            CalcFormula = max("Sales Invoice Header"."No." where("Sell-to Customer No." = field("No.")));

        }
        field(50301; LastShipment; Code[20])
        {
            CaptionML = ENU = 'Last Shipment', ESP = 'Último albarán';
            FieldClass = FlowField;
            TableRelation = "Sales Shipment Header";
            CalcFormula = max("Sales Shipment Header"."No." where("Sell-to Customer No." = field("No.")));

        }
        field(50302; LastOrder; Code[20])
        {
            CaptionML = ENU = 'Last Order', ESP = 'Último pedido';
            FieldClass = FlowField;
            TableRelation = "Sales Header";
            CalcFormula = max("Sales Header"."No." where("Sell-to Customer No." = field("No."), "Document Type" = filter('Order')));
        }
        field(50303; LastCreditMemo; Code[20])
        {
            CaptionML = ENU = 'Last Credit Memo', ESP = 'Último abono';
            FieldClass = FlowField;
            TableRelation = "Sales Header";
            CalcFormula = max("Sales Header"."No." where("Sell-to Customer No." = field("No."), "Document Type" = filter('Credit Memo')));
        }
        field(50304; InventoryWarning; Boolean)
        {
            CaptionML = ENU = 'Inventory Warning', ESP = 'Aviso Inventario';
        }
    }
}