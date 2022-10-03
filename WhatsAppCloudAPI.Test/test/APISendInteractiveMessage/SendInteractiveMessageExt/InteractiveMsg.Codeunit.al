codeunit 77057 "obc WA Test Interactive Msg" implements "obc WA IInteractiveMessage"
{
    procedure SendInteractiveMessage(Endpoint: enum "obc WA Endpoint"; Parameter: Dictionary of [enum "obc WA Param InteractiveMsg", Text]; var HttpResponse: HttpResponseMessage): Boolean;
    var
        Param: Enum "obc WA Param InteractiveMsg";
    begin
        Assert.AreEqual(Endpoint, Endpoint::"Facebook Graph", 'Endpoint should be equal to Facebook Graph');
        Assert.IsTrue(Parameter.ContainsKey(Param::BearerToken), 'Parameter should contain BearerToken');
        Assert.IsTrue(Parameter.ContainsKey(Param::PhoneNumberId), 'Parameter should contain PhoneNumberId');
        Assert.IsTrue(Parameter.ContainsKey(Param::PhoneNumberTo), 'Parameter should contain PhoneNumberTo');
        Assert.IsTrue(Parameter.ContainsKey(Param::interactive), 'Parameter should contain interactive');

        exit(true);
    end;

    procedure SendInteractiveMessage(Endpoint: enum "obc WA Endpoint"; Parameter: Dictionary of [enum "obc WA Param InteractiveMsg", Text]; var JsonResponse: JsonObject): Boolean;
    var
        Param: Enum "obc WA Param InteractiveMsg";
    begin
        Assert.AreEqual(Endpoint, Endpoint::"Facebook Graph", 'Endpoint should be equal to Facebook Graph');
        Assert.IsTrue(Parameter.ContainsKey(Param::BearerToken), 'Parameter should contain BearerToken');
        Assert.IsTrue(Parameter.ContainsKey(Param::PhoneNumberId), 'Parameter should contain PhoneNumberId');
        Assert.IsTrue(Parameter.ContainsKey(Param::PhoneNumberTo), 'Parameter should contain PhoneNumberTo');
        Assert.IsTrue(Parameter.ContainsKey(Param::interactive), 'Parameter should contain interactive');

        exit(true);
    end;

    var
        Assert: Codeunit Assert;

}