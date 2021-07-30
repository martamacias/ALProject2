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
                    trigger OnDrillDown()
                    var
                        tinvoice: Record "Sales Invoice Header";
                        pinvoice: Page "Posted Sales Invoice";
                    begin
                        tinvoice.Init();
                        tinvoice.SetFilter("No.", Rec.LastInvoice);
                        if tinvoice.FindFirst() then begin
                            pinvoice.SetTableView(tinvoice);
                            pinvoice.Run();
                        end
                    end;
                }
                field(LastShipment; Rec.LastShipment)
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica el valor del campo LastShipment.';
                    trigger OnDrillDown()
                    var
                        tshipment: Record "Sales Shipment Header";
                        pshipment: Page "Posted Sales Shipment";
                    begin
                        tshipment.Init();
                        tshipment.SetFilter("No.", Rec.LastShipment);
                        if tshipment.FindFirst() then begin
                            pshipment.SetTableView(tshipment);
                            pshipment.Run();
                        end
                    end;
                }
                field(LastOrder; Rec.LastOrder)
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica el valor del campo LastOrder.';
                    trigger OnDrillDown()
                    var
                        tsalesorder: Record "Sales Header";
                        psalesorder: Page "Sales Order";
                    begin
                        tsalesorder.Init();
                        tsalesorder.SetFilter("No.", Rec.LastOrder);
                        if tsalesorder.FindFirst() then begin
                            psalesorder.SetTableView(tsalesorder);
                            psalesorder.Run();
                        end
                    end;
                }
                field(LastCreditMemo; Rec.LastCreditMemo)
                {
                    ApplicationArea = All;
                    ToolTip = 'Especifica el valor del campo LastCreditMemo.';
                    trigger OnDrillDown()
                    var
                        tcreditmemo: Record "Sales Header";
                        pcreditmemo: Page "Sales Credit Memo";
                    begin
                        tcreditmemo.Init();
                        tcreditmemo.SetFilter("No.", Rec.LastCreditMemo);
                        if tcreditmemo.FindFirst() then begin
                            pcreditmemo.SetTableView(tcreditmemo);
                            pcreditmemo.Run();
                        end
                    end;
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