codeunit 50211 "obc WA Test SendMediaMsg"
{
    Subtype = Test;
    TestPermissions = Disabled;

    [Test]
    procedure SendMediaMessageWithHttp()
    var
        APIMessages: Codeunit "obc WA API Messages";
        HttpResponse: HttpResponseMessage;

        Endpoint: Enum "obc WA Endpoint";
        APIVersion: Enum "obc WA API MediaMessage";
        MediaMessageType: Enum "obc WA MediaMessage Type";
        Param: Dictionary of [Enum "obc WA Param MediaMessage", Text];
    begin
        // [Scenario] Invoke an invalid webserviceCall to WhatsApp Business Cloud API using the HttpResponse overload
        // [Given]  O365BusFull Permissions
        Inizialize();

        //Using permissions that do not include SUPER
        LibraryLowerPermissions.SetO365BusFull();

        //[Then] Create Parameter    
        CreateMediaMessageParam(Param);

        //[Then] Verify TTS response  
        Assert.IsTrue(APIMessages.SendMediaMessage(Endpoint::"Facebook Graph", APIVersion::"obc Wa Test", MediaMessageType::image, Param, HttpResponse), 'WA Rest API should return true');
    end;

    [Test]
    procedure SendMediaMessageWithJson()
    var
        APIMessages: Codeunit "obc WA API Messages";
        JResponse: JsonObject;

        Endpoint: Enum "obc WA Endpoint";
        APIVersion: Enum "obc WA API MediaMessage";
        MediaMessageType: Enum "obc WA MediaMessage Type";
        Param: Dictionary of [Enum "obc WA Param MediaMessage", Text];
    begin
        // [Scenario] Invoke an invalid webserviceCall to WhatsApp Business Cloud API using the HttpResponse overload
        // [Given]  O365BusFull Permissions
        Inizialize();

        //Using permissions that do not include SUPER
        LibraryLowerPermissions.SetO365BusFull();

        //[Then] Create Parameter    
        CreateMediaMessageParam(Param);

        //[Then] Verify TTS response  
        Assert.IsTrue(APIMessages.SendMediaMessage(Endpoint::"Facebook Graph", APIVersion::"obc Wa Test", MediaMessageType::image, Param, JResponse), 'WA Rest API should return true');
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

    local procedure CreateMediaMessageParam(var Param: Dictionary of [Enum "obc WA Param MediaMessage", Text])
    var
        MediaMessageParam: Enum "obc WA Param MediaMessage";
    begin
        Clear(Param);
        Param.Add(MediaMessageParam::BearerToken, Any.AlphanumericText(100));
        Param.Add(MediaMessageParam::PhoneNumberId, Any.AlphanumericText(100));
        Param.Add(MediaMessageParam::PhoneNumberTo, Any.AlphanumericText(100));
        Param.Add(MediaMessageParam::caption, Any.AlphanumericText(100));
        Param.Add(MediaMessageParam::filename, Any.AlphanumericText(100));
        Param.Add(MediaMessageParam::id, Any.AlphanumericText(100));
        Param.Add(MediaMessageParam::link, Any.AlphanumericText(100));
        Param.Add(MediaMessageParam::provider, Any.AlphanumericText(100));
    end;

    var
        Any: Codeunit Any;
        Assert: Codeunit "Library Assert";
        LibraryLowerPermissions: Codeunit "Library - Lower Permissions";
        IsInitialized: Boolean;
}