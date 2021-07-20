pageextension 50000 CustomerCardDonation extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("Customer Type"; Rec."Customer Type")
            {
                ToolTip = 'Especifica el valor del campo Customer Type.';
            }
        }
    }

    actions
    {
        addfirst("&Customer")
        {
            action("Member Donations")
            {
                CaptionML = ENU = 'Member Donations', ESP = 'Donaciones Socios';
                ToolTip = 'Ejecuta la página Member Donations List';
                Image = Allocations;
                RunObject = page "Member Donation List";
                RunPageLink = "Customer No." = FIELD("No.");
            }
        }
    }
}