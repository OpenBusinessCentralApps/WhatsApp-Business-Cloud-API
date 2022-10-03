codeunit 77063 "obc WA Test Msg Template" implements "obc WA IMessageTemplate"
{

    procedure SendMessageTemplate(Endpoint: enum "obc WA Endpoint"; Parameter: Dictionary of [enum "obc WA Param MessageTemplate", Text]; var HttpResponse: HttpResponseMessage): Boolean;
    var
        Param: Enum "obc WA Param MessageTemplate";
    begin
        Assert.AreEqual(Endpoint, Endpoint::"Facebook Graph", 'Endpoint should be equal to Facebook Graph');
        Assert.IsTrue(Parameter.ContainsKey(Param::BearerToken), 'Parameter should contain BearerToken');
        Assert.IsTrue(Parameter.ContainsKey(Param::PhoneNumberId), 'Parameter should contain PhoneNumberId');
        Assert.IsTrue(Parameter.ContainsKey(Param::PhoneNumberTo), 'Parameter should contain PhoneNumberTo');
        Assert.IsTrue(Parameter.ContainsKey(Param::LanguageCode), 'Parameter should contain LanguageCode');
        Assert.IsTrue(Parameter.ContainsKey(Param::TemplateName), 'Parameter should contain TemplateName');
        Assert.IsTrue(Parameter.ContainsKey(Param::components), 'Parameter should contain components');

        exit(true);
    end;

    procedure SendMessageTemplate(Endpoint: enum "obc WA Endpoint"; Parameter: Dictionary of [enum "obc WA Param MessageTemplate", Text]; var JsonResponse: JsonObject): Boolean;
    var
        Param: Enum "obc WA Param MessageTemplate";
    begin
        Assert.AreEqual(Endpoint, Endpoint::"Facebook Graph", 'Endpoint should be equal to Facebook Graph');
        Assert.IsTrue(Parameter.ContainsKey(Param::BearerToken), 'Parameter should contain BearerToken');
        Assert.IsTrue(Parameter.ContainsKey(Param::PhoneNumberId), 'Parameter should contain PhoneNumberId');
        Assert.IsTrue(Parameter.ContainsKey(Param::PhoneNumberTo), 'Parameter should contain PhoneNumberTo');
        Assert.IsTrue(Parameter.ContainsKey(Param::LanguageCode), 'Parameter should contain LanguageCode');
        Assert.IsTrue(Parameter.ContainsKey(Param::TemplateName), 'Parameter should contain TemplateName');
        Assert.IsTrue(Parameter.ContainsKey(Param::components), 'Parameter should contain components');

        exit(true);
    end;

    var
        Assert: Codeunit Assert;
}