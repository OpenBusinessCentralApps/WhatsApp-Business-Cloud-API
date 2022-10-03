codeunit 77065 "obc WA Test Text Message" implements "obc WA ITextMessage"
{
    procedure SendTextMessage(Endpoint: enum "obc WA Endpoint"; Parameter: Dictionary of [enum "obc WA Param TextMessage", Text]; var HttpResponse: HttpResponseMessage): Boolean;
    var
        Param: Enum "obc WA Param TextMessage";
    begin
        Assert.AreEqual(Endpoint, Endpoint::"Facebook Graph", 'Endpoint should be equal to Facebook Graph');
        Assert.IsTrue(Parameter.ContainsKey(Param::BearerToken), 'Parameter should contain BearerToken');
        Assert.IsTrue(Parameter.ContainsKey(Param::PhoneNumberId), 'Parameter should contain PhoneNumberId');
        Assert.IsTrue(Parameter.ContainsKey(Param::PhoneNumberTo), 'Parameter should contain PhoneNumberTo');
        Assert.IsTrue(Parameter.ContainsKey(Param::body), 'Parameter should contain body');
        Assert.IsTrue(Parameter.ContainsKey(Param::preview_url), 'Parameter should contain preview_url');

        exit(true);
    end;

    procedure SendTextMessage(Endpoint: enum "obc WA Endpoint"; Parameter: Dictionary of [enum "obc WA Param TextMessage", Text]; var JsonResponse: JsonObject): Boolean;
    var
        Param: Enum "obc WA Param TextMessage";
    begin
        Assert.AreEqual(Endpoint, Endpoint::"Facebook Graph", 'Endpoint should be equal to Facebook Graph');
        Assert.IsTrue(Parameter.ContainsKey(Param::BearerToken), 'Parameter should contain BearerToken');
        Assert.IsTrue(Parameter.ContainsKey(Param::PhoneNumberId), 'Parameter should contain PhoneNumberId');
        Assert.IsTrue(Parameter.ContainsKey(Param::PhoneNumberTo), 'Parameter should contain PhoneNumberTo');
        Assert.IsTrue(Parameter.ContainsKey(Param::body), 'Parameter should contain body');
        Assert.IsTrue(Parameter.ContainsKey(Param::preview_url), 'Parameter should contain preview_url');

        exit(true);
    end;

    var
        Assert: Codeunit Assert;
}