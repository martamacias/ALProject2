enum 50200 ShippingCostsEnum
{
    Extensible = false;

    value(0; "") { }
    value(1; Paid)
    {
        CaptionML = ESP = 'Pagados', ENU = 'Paid';
    }
    value(2; Due)
    {
        CaptionML = ESP = 'Debidos', ENU = 'Due';
    }
}