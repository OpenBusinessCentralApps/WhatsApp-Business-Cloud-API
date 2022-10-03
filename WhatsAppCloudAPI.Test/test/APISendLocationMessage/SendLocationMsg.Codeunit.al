codeunit 77058 "obc WA Test SendLocationMsg"
{
    Subtype = Test;
    TestPermissions = Disabled;

    [Test]
    procedure SendLocationMessageWithHttp()
    var
        APIMessages: Codeunit "obc WA API Messages";
        HttpResponse: HttpResponseMessage;

        Endpoint: Enum "obc WA Endpoint";
        APIVersion: Enum "obc WA API LocationMessage";
        Param: Dictionary of [Enum "obc WA Param LocationMessage", Text];
    begin
        // [Scenario] Invoke an invalid webserviceCall to WhatsApp Business Cloud API using the HttpResponse overload
        // [Given]  O365BusFull Permissions
        Inizialize();

        //Using permissions that do not include SUPER
        LibraryLowerPermissions.SetO365BusFull();

        //[Then] Create Parameter    
        CreateLocationMessageParam(Param);

        //[Then] Verify TTS response  
        Assert.IsTrue(APIMessages.SendLocationMessage(Endpoint::"Facebook Graph", APIVersion::"obc Wa Test", Param, HttpResponse), 'WA Rest API should return true');
    end;

    [Test]
    procedure SendLocationMessageWithJson()
    var
        APIMessages: Codeunit "obc WA API Messages";
        JResponse: JsonObject;

        Endpoint: Enum "obc WA Endpoint";
        APIVersion: Enum "obc WA API LocationMessage";
        Param: Dictionary of [Enum "obc WA Param LocationMessage", Text];
    begin
        // [Scenario] Invoke an invalid webserviceCall to WhatsApp Business Cloud API using the HttpResponse overload
        // [Given]  O365BusFull Permissions
        Inizialize();

        //Using permissions that do not include SUPER
        LibraryLowerPermissions.SetO365BusFull();

        //[Then] Create Parameter    
        CreateLocationMessageParam(Param);

        //[Then] Verify TTS response  
        Assert.IsTrue(APIMessages.SendLocationMessage(Endpoint::"Facebook Graph", APIVersion::"obc Wa Test", Param, JResponse), 'WA Rest API should return true');
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

    local procedure CreateLocationMessageParam(var Param: Dictionary of [Enum "obc WA Param LocationMessage", Text])
    var
        LocationMessageParam: Enum "obc WA Param LocationMessage";
    begin
        Clear(Param);
        Param.Add(LocationMessageParam::BearerToken, Any.AlphanumericText(100));
        Param.Add(LocationMessageParam::PhoneNumberId, Any.AlphanumericText(100));
        Param.Add(LocationMessageParam::PhoneNumberTo, Any.AlphanumericText(100));
        Param.Add(LocationMessageParam::latitude, Any.AlphanumericText(100));
        Param.Add(LocationMessageParam::longitude, Any.AlphanumericText(100));
        Param.Add(LocationMessageParam::address, Any.AlphanumericText(100));
        Param.Add(LocationMessageParam::name, Any.AlphanumericText(100));
    end;

    var
        Any: Codeunit Any;
        Assert: Codeunit "Library Assert";
        LibraryLowerPermissions: Codeunit "Library - Lower Permissions";
        IsInitialized: Boolean;
}