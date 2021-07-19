codeunit 50200 VendorMgt
{
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Table, 23, 'OnBeforeInsertEvent', '', true, true)]
    local procedure SetInsertDate(var Rec: Record Vendor)
    begin
        Rec."Insert Date" := WorkDate();
    end;

    [EventSubscriber(ObjectType::Table, 23, 'OnAfterValidateEvent', 'Blocked', true, true)]
    local procedure SetBlockPropieries(var Rec: Record Vendor)
    var
        usersetup: Record "User Setup";
    begin
        usersetup.Get(UserId);
        if Rec.Blocked <> Rec.Blocked::" " then begin
            Rec."Block Date" := WorkDate();
            Rec."Block User" := usersetup."User ID";
        end
        else begin
            Rec."Block Date" := 0D;
            Rec."Block User" := '';
        end;
    end;
}
