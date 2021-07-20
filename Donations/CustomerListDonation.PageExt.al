pageextension 50001 CustomerListDonation extends "Customer List"
{
    layout
    {
        addlast(Control1)
        {
            field("Customer Type"; Rec."Customer Type")
            {
                ToolTip = 'Especifica el valor del campo Customer Type.';
            }
        }
    }
}