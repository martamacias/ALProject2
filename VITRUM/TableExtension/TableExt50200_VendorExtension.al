tableextension 50200 VendorExtension extends Vendor
{
    fields
    {
        field(50200; "Shipping Costs"; Enum ShippingCostsEnum)
        {
            CaptionML = ESP = 'Portes', ENU = 'Shipping Costs';
            DataClassification = ToBeClassified;
        }
        field(50201; "Invoice Period"; Enum InvoicePeriodEnum)
        {
            CaptionML = ESP = 'Periodo facturación', ENU = 'Invoice Period';
            DataClassification = ToBeClassified;
        }
        field(50202; "Insert Date"; Date)
        {
            CaptionML = ESP = 'Fecha de alta', ENU = 'Insert Date';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50203; "Block Date"; Date)
        {
            CaptionML = ESP = 'Fecha de baja', ENU = 'Block Date';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50204; "Block Reason"; Text[50])
        {
            CaptionML = ESP = 'Motivo baja', ENU = 'Block Reason';
            DataClassification = ToBeClassified;
        }
        field(50205; "Block User"; Code[50])
        {
            CaptionML = ESP = 'Usuario baja', ENU = 'Block User';
            DataClassification = ToBeClassified;
            TableRelation = "User Setup";
        }
    }
}