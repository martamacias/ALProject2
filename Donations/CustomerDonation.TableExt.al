tableextension 50000 CustomerDonation extends Customer
{
    fields
    {
        field(50000; "Customer Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Customer,Member,Donor,Financer;
            OptionCaptionML = ENU = ' ,Customer,Member,Donor,Financer', ESP = ' ,Cliente,Socio,Donante,Financiador';
            CaptionML = ENU = 'Customer Type', ESP = 'Tipo de cliente';
        }
    }
}