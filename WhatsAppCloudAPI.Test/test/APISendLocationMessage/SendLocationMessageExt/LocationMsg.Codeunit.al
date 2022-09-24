codeunit 50209 "obc WA Test Location Msg" implements "obc WA ILocationMessage"
{
    procedure SendLocationMessage(Endpoint: enum "obc WA Endpoint"; Parameter: Dictionary of [enum "obc WA Param LocationMessage", Text]; var HttpResponse: HttpResponseMessage): Boolean;
    var
        Param: Enum "obc WA Param LocationMessage";
    begin
        Assert.AreEqual(Endpoint, Endpoint::"Facebook Graph", 'Endpoint should be equal to Facebook Graph');
        Assert.IsTrue(Parameter.ContainsKey(Param::BearerToken), 'Parameter should contain BearerToken');
        Assert.IsTrue(Parameter.ContainsKey(Param::PhoneNumberId), 'Parameter should contain PhoneNumberId');
        Assert.IsTrue(Parameter.ContainsKey(Param::PhoneNumberTo), 'Parameter should contain PhoneNumberTo');
        Assert.IsTrue(Parameter.ContainsKey(Param::address), 'Parameter should contain address');
        Assert.IsTrue(Parameter.ContainsKey(Param::name), 'Parameter should contain name');
        Assert.IsTrue(Parameter.ContainsKey(Param::latitude), 'Parameter should contain latitude');
        Assert.IsTrue(Parameter.ContainsKey(Param::longitude), 'Parameter should contain longitude');

        exit(true);
    end;

    procedure SendLocationMessage(Endpoint: enum "obc WA Endpoint"; Parameter: Dictionary of [enum "obc WA Param LocationMessage", Text]; var JsonResponse: JsonObject): Boolean;
    var
        Param: Enum "obc WA Param LocationMessage";
    begin
        Assert.AreEqual(Endpoint, Endpoint::"Facebook Graph", 'Endpoint should be equal to Facebook Graph');
        Assert.IsTrue(Parameter.ContainsKey(Param::BearerToken), 'Parameter should contain BearerToken');
        Assert.IsTrue(Parameter.ContainsKey(Param::PhoneNumberId), 'Parameter should contain PhoneNumberId');
        Assert.IsTrue(Parameter.ContainsKey(Param::PhoneNumberTo), 'Parameter should contain PhoneNumberTo');
        Assert.IsTrue(Parameter.ContainsKey(Param::address), 'Parameter should contain address');
        Assert.IsTrue(Parameter.ContainsKey(Param::name), 'Parameter should contain name');
        Assert.IsTrue(Parameter.ContainsKey(Param::latitude), 'Parameter should contain latitude');
        Assert.IsTrue(Parameter.ContainsKey(Param::longitude), 'Parameter should contain longitude');

        exit(true);
    end;

    var
        Assert: Codeunit Assert;
}