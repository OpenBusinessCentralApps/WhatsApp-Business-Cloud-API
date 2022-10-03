codeunit 77056 "obc WA Test SendInteractiveMsg"
{
    Subtype = Test;
    TestPermissions = Disabled;

    [Test]
    procedure SendInteractiveMessageWithHttp()
    var
        APIMessages: Codeunit "obc WA API Messages";
        HttpResponse: HttpResponseMessage;

        Endpoint: Enum "obc WA Endpoint";
        APIVersion: Enum "obc WA API InteractiveMsg";
        Param: Dictionary of [Enum "obc WA Param InteractiveMsg", Text];
    begin
        // [Scenario] Invoke an invalid webserviceCall to WhatsApp Business Cloud API using the HttpResponse overload
        // [Given]  O365BusFull Permissions
        Inizialize();

        //Using permissions that do not include SUPER
        LibraryLowerPermissions.SetO365BusFull();

        //[Then] Create Parameter    
        CreateInteractiveMessageParam(Param);

        //[Then] Verify TTS response  
        Assert.IsTrue(APIMessages.SendInteractiveMessage(Endpoint::"Facebook Graph", APIVersion::"obc Wa Test", Param, HttpResponse), 'WA Rest API should return true');
    end;

    [Test]
    procedure SendInteractiveMessageWithJson()
    var
        APIMessages: Codeunit "obc WA API Messages";
        JResponse: JsonObject;

        Endpoint: Enum "obc WA Endpoint";
        APIVersion: Enum "obc WA API InteractiveMsg";
        Param: Dictionary of [Enum "obc WA Param InteractiveMsg", Text];
    begin
        // [Scenario] Invoke an invalid webserviceCall to WhatsApp Business Cloud API using the HttpResponse overload
        // [Given]  O365BusFull Permissions
        Inizialize();

        //Using permissions that do not include SUPER
        LibraryLowerPermissions.SetO365BusFull();

        //[Then] Create Parameter    
        CreateInteractiveMessageParam(Param);

        //[Then] Verify TTS response  
        Assert.IsTrue(APIMessages.SendInteractiveMessage(Endpoint::"Facebook Graph", APIVersion::"obc Wa Test", Param, JResponse), 'WA Rest API should return true');
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

    local procedure CreateInteractiveMessageParam(var Param: Dictionary of [Enum "obc WA Param InteractiveMsg", Text])
    var
        InteractiveMessageParam: Enum "obc WA Param InteractiveMsg";
    begin
        Clear(Param);
        Param.Add(InteractiveMessageParam::BearerToken, Any.AlphanumericText(100));
        Param.Add(InteractiveMessageParam::PhoneNumberId, Any.AlphanumericText(100));
        Param.Add(InteractiveMessageParam::PhoneNumberTo, Any.AlphanumericText(100));
        Param.Add(InteractiveMessageParam::interactive, Any.AlphanumericText(100));
    end;

    var
        Any: Codeunit Any;
        Assert: Codeunit "Library Assert";
        LibraryLowerPermissions: Codeunit "Library - Lower Permissions";
        IsInitialized: Boolean;
}