codeunit 77052 "obc WA Test SendContactMsg"
{
    Subtype = Test;
    TestPermissions = Disabled;

    [Test]
    procedure SendContactMessageWithHttp()
    var
        APIMessages: Codeunit "obc WA API Messages";
        HttpResponse: HttpResponseMessage;

        Endpoint: Enum "obc WA Endpoint";
        APIVersion: Enum "obc WA API ContactMessage";
        Param: Dictionary of [Enum "obc WA Param ContactMessage", Text];
    begin
        // [Scenario] Invoke an invalid webserviceCall to WhatsApp Business Cloud API using the HttpResponse overload
        // [Given]  O365BusFull Permissions
        Inizialize();

        //Using permissions that do not include SUPER
        LibraryLowerPermissions.SetO365BusFull();

        //[Then] Create Parameter    
        CreateContactMessageParam(Param);

        //[Then] Verify TTS response  
        Assert.IsTrue(APIMessages.SendContactMessage(Endpoint::"Facebook Graph", APIVersion::"obc Wa Test", Param, HttpResponse), 'WA Rest API should return true');
    end;

    [Test]
    procedure SendContactMessageWithJson()
    var
        APIMessages: Codeunit "obc WA API Messages";
        JResponse: JsonObject;

        Endpoint: Enum "obc WA Endpoint";
        APIVersion: Enum "obc WA API ContactMessage";
        Param: Dictionary of [Enum "obc WA Param ContactMessage", Text];
    begin
        // [Scenario] Invoke an invalid webserviceCall to WhatsApp Business Cloud API using the HttpResponse overload
        // [Given]  O365BusFull Permissions
        Inizialize();

        //Using permissions that do not include SUPER
        LibraryLowerPermissions.SetO365BusFull();

        //[Then] Create Parameter    
        CreateContactMessageParam(Param);

        //[Then] Verify TTS response  
        Assert.IsTrue(APIMessages.SendContactMessage(Endpoint::"Facebook Graph", APIVersion::"obc Wa Test", Param, JResponse), 'WA Rest API should return true');
    end;

    local procedure Inizialize()
    var
        WAMgt: Codeunit "obc WA App Mgt.";
    begin
        if IsInitialized then
            exit;

        WAMgt.EnableWebserviceCallsInSandbox();
        IsInitialized := true;
    end;

    local procedure CreateContactMessageParam(var Param: Dictionary of [Enum "obc WA Param ContactMessage", Text])
    var
        ContactMessageParam: Enum "obc WA Param ContactMessage";
    begin
        Clear(Param);
        Param.Add(ContactMessageParam::BearerToken, Any.AlphanumericText(100));
        Param.Add(ContactMessageParam::contacts, Any.AlphanumericText(100));
        Param.Add(ContactMessageParam::PhoneNumberId, Any.AlphanumericText(100));
        Param.Add(ContactMessageParam::PhoneNumberTo, Any.AlphanumericText(100));
    end;

    var
        Any: Codeunit Any;
        Assert: Codeunit "Library Assert";
        LibraryLowerPermissions: Codeunit "Library - Lower Permissions";
        IsInitialized: Boolean;
}