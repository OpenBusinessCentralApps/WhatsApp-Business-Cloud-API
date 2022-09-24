codeunit 50205 "obc WA Test SendGenericMsg"
{
    Subtype = Test;
    TestPermissions = Disabled;

    [Test]
    procedure SendGenericMessageWithHttp()
    var
        APIMessages: Codeunit "obc WA API Messages";
        HttpResponse: HttpResponseMessage;

        Endpoint: Enum "obc WA Endpoint";
        APIVersion: Enum "obc WA API GenericMessage";
        Param: Dictionary of [Enum "obc WA Param GenericMessage", Text];
    begin
        // [Scenario] Invoke an invalid webserviceCall to WhatsApp Business Cloud API using the HttpResponse overload
        // [Given]  O365BusFull Permissions
        Inizialize();

        //Using permissions that do not include SUPER
        LibraryLowerPermissions.SetO365BusFull();

        //[Then] Create Parameter    
        CreateGenericMessageParam(Param);

        //[Then] Verify TTS response  
        Assert.IsTrue(APIMessages.SendGenericMessage(Endpoint::"Facebook Graph", APIVersion::"obc Wa Test", Param, HttpResponse), 'WA Rest API should return true');
    end;

    [Test]
    procedure SendGenericMessageWithJson()
    var
        APIMessages: Codeunit "obc WA API Messages";
        JResponse: JsonObject;

        Endpoint: Enum "obc WA Endpoint";
        APIVersion: Enum "obc WA API GenericMessage";
        Param: Dictionary of [Enum "obc WA Param GenericMessage", Text];
    begin
        // [Scenario] Invoke an invalid webserviceCall to WhatsApp Business Cloud API using the HttpResponse overload
        // [Given]  O365BusFull Permissions
        Inizialize();

        //Using permissions that do not include SUPER
        LibraryLowerPermissions.SetO365BusFull();

        //[Then] Create Parameter    
        CreateGenericMessageParam(Param);

        //[Then] Verify TTS response  
        Assert.IsTrue(APIMessages.SendGenericMessage(Endpoint::"Facebook Graph", APIVersion::"obc Wa Test", Param, JResponse), 'WA Rest API should return true');
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

    local procedure CreateGenericMessageParam(var Param: Dictionary of [Enum "obc WA Param GenericMessage", Text])
    var
        GenericMessageParam: Enum "obc WA Param GenericMessage";
    begin
        Clear(Param);
        Param.Add(GenericMessageParam::BearerToken, Any.AlphanumericText(100));
        Param.Add(GenericMessageParam::PhoneNumberId, Any.AlphanumericText(100));
        Param.Add(GenericMessageParam::Payload, Any.AlphanumericText(100));
    end;

    var
        Any: Codeunit Any;
        Assert: Codeunit "Library Assert";
        LibraryLowerPermissions: Codeunit "Library - Lower Permissions";
        IsInitialized: Boolean;
}