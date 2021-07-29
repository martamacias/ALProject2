// Ejercicio 4
page 50300 "Customer Records List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    SourceTable = Customer;
    CaptionML = ENU = 'Customer Records', ESP = 'Registros de Clientes';
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica el valor del campo No..';

                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica el valor del campo Name.';
                }
                field(Balance; Rec.Balance)
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica el valor del campo Balance.';
                }
                field(LastInvoice; Rec.LastInvoice)
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica el valor del campo LastInvoice.';
                }
                field(LastShipment; Rec.LastShipment)
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica el valor del campo LastShipment.';
                }
                field(LastOrder; Rec.LastOrder)
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica el valor del campo LastOrder.';

                }
                field(LastCreditMemo; Rec.LastCreditMemo)
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica el valor del campo LastCreditMemo.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(showLastInvoice)
            {
                ApplicationArea = All;
                CaptionML = ENU = 'Last Invoice', ESP = 'Última Factura';
                Image = SalesInvoice;

                RunObject = Page "Posted Sales Invoice";
                RunPageLink = "Sell-to Customer No." = field("No."), "No." = field(LastInvoice);
                RunPageMode = View;
                ToolTip = 'Ejecuta la acción showLastInvoice:';
            }
            action(showLastShipment)
            {
                ApplicationArea = All;
                CaptionML = ENU = 'Last Shipment', ESP = 'Último Albarán';
                Image = Shipment;

                RunObject = Page "Posted Sales Shipment";
                RunPageLink = "Sell-to Customer No." = field("No."), "No." = field(LastShipment);
                RunPageMode = View;
                ToolTip = 'Ejecuta la acción showLastShipment:';
            }
            action(showLastOrder)
            {
                ApplicationArea = All;
                CaptionML = ENU = 'Last Order', ESP = 'Último Pedido';
                Image = CoupledOrderList;

                RunObject = Page "Sales Order";
                RunPageLink = "Sell-to Customer No." = field("No."), "No." = field(LastOrder);
                RunPageMode = View;
                ToolTip = 'Ejecuta la acción showLastOrder:';
            }
            action(showLastCreditMemo)
            {
                ApplicationArea = All;
                CaptionML = ENU = 'Last Credit Memo', ESP = 'Último Abono';
                Image = FindCreditMemo;

                RunObject = Page "Sales Credit Memo";
                RunPageLink = "Sell-to Customer No." = field("No."), "No." = field(LastCreditMemo);
                RunPageMode = View;
                ToolTip = 'Ejecuta la acción showLastCreditMemo:';
            }
        }
    }
}