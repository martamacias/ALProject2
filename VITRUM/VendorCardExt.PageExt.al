pageextension 50200 VendorCardExt extends "Vendor Card"
{
    layout
    {
        addlast(General)
        {
            field("Shipping Agent Code"; Rec."Shipping Agent Code")
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Especifica el valor del campo Shipping Agent Code.';
            }
            field("Shipping Costs"; Rec."Shipping Costs")
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Especifica el valor del campo Shipping Costs.';
            }
            field("Invoice Period"; Rec."Invoice Period")
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Especifica el valor del campo Invoice Period.';
            }
            field("Insert Date"; Rec."Insert Date")
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Especifica el valor del campo Insert Date.';
            }
            field("Block Date"; Rec."Block Date")
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Especifica el valor del campo Block Date.';
            }
            field("Block Reason"; Rec."Block Reason")
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Especifica el valor del campo Block Reason.';
            }
            field("Block User"; Rec."Block User")
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Especifica el valor del campo Block User.';
            }
        }
    }
}
