codeunit 50212 "obc WA Test SendMsgTemplate"
{
    Subtype = Test;
    TestPermissions = Disabled;

    [Test]
    procedure SendMessageTemplateWithHttp()
    var
        APIMessages: Codeunit "obc WA API Messages";
        HttpResponse: HttpResponseMessage;

        Endpoint: Enum "obc WA Endpoint";
        APIVersion: Enum "obc WA API MessageTemplate";
        Param: Dictionary of [Enum "obc WA Param MessageTemplate", Text];
    begin
        // [Scenario] Invoke an invalid webserviceCall to WhatsApp Business Cloud API using the HttpResponse overload
        // [Given]  O365BusFull Permissions
        Inizialize();

        //Using permissions that do not include SUPER
        LibraryLowerPermissions.SetO365BusFull();

        //[Then] Create Parameter    
        CreateMessageTemplateParam(Param);

        //[Then] Verify TTS response  
        Assert.IsTrue(APIMessages.SendMessageTemplate(Endpoint::"Facebook Graph", APIVersion::"obc Wa Test", Param, HttpResponse), 'WA Rest API should return true');
    end;

    [Test]
    procedure SendMessageTemplateWithJson()
    var
        APIMessages: Codeunit "obc WA API Messages";
        JResponse: JsonObject;

        Endpoint: Enum "obc WA Endpoint";
        APIVersion: Enum "obc WA API MessageTemplate";
        Param: Dictionary of [Enum "obc WA Param MessageTemplate", Text];
    begin
        // [Scenario] Invoke an invalid webserviceCall to WhatsApp Business Cloud API using the HttpResponse overload
        // [Given]  O365BusFull Permissions
        Inizialize();

        //Using permissions that do not include SUPER
        LibraryLowerPermissions.SetO365BusFull();

        //[Then] Create Parameter    
        CreateMessageTemplateParam(Param);

        //[Then] Verify TTS response  
        Assert.IsTrue(APIMessages.SendMessageTemplate(Endpoint::"Facebook Graph", APIVersion::"obc Wa Test", Param, JResponse), 'WA Rest API should return true');
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

    local procedure CreateMessageTemplateParam(var Param: Dictionary of [Enum "obc WA Param MessageTemplate", Text])
    var
        MsgTemplateMessageParam: Enum "obc WA Param MessageTemplate";
    begin
        Clear(Param);
        Param.Add(MsgTemplateMessageParam::BearerToken, Any.AlphanumericText(100));
        Param.Add(MsgTemplateMessageParam::PhoneNumberId, Any.AlphanumericText(100));
        Param.Add(MsgTemplateMessageParam::PhoneNumberTo, Any.AlphanumericText(100));
        Param.Add(MsgTemplateMessageParam::LanguageCode, Any.AlphanumericText(100));
        Param.Add(MsgTemplateMessageParam::TemplateName, Any.AlphanumericText(100));
        Param.Add(MsgTemplateMessageParam::components, Any.AlphanumericText(100));
    end;

    var
        Any: Codeunit Any;
        Assert: Codeunit "Library Assert";
        LibraryLowerPermissions: Codeunit "Library - Lower Permissions";
        IsInitialized: Boolean;
}