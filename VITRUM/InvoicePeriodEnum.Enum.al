enum 50201 InvoicePeriodEnum
{
    Extensible = false;

    value(0; "") { }
    value(1; Daily)
    {
        CaptionML = ESP = 'Diario', ENU = 'Daily';
    }
    value(2; Weekly)
    {
        CaptionML = ESP = 'Semanal', ENU = 'Weekly';
    }
    value(3; Biweekly)
    {
        CaptionML = ESP = 'Quincenal', ENU = 'Biweekly';
    }
    value(4; Monthly)
    {
        CaptionML = ESP = 'Mensual', ENU = 'Monthly';
    }
    value(5; Quarterly)
    {
        CaptionML = ESP = 'Trimestral', ENU = 'Quarterly';
    }
}