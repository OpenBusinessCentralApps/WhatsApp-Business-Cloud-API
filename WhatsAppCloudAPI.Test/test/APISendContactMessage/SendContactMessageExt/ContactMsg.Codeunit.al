codeunit 50203 "obc WA Test Contact Msg" implements "obc WA IContactMessage"
{
    procedure SendContactMessage(Endpoint: enum "obc WA Endpoint"; Parameter: Dictionary of [enum "obc WA Param ContactMessage", Text]; var HttpResponse: HttpResponseMessage): Boolean;
    var
        Param: Enum "obc WA Param ContactMessage";
    begin
        Assert.AreEqual(Endpoint, Endpoint::"Facebook Graph", 'Endpoint should be equal to Facebook Graph');
        Assert.IsTrue(Parameter.ContainsKey(Param::BearerToken), 'Parameter should contain BearerToken');
        Assert.IsTrue(Parameter.ContainsKey(Param::PhoneNumberId), 'Parameter should contain PhoneNumberId');
        Assert.IsTrue(Parameter.ContainsKey(Param::PhoneNumberTo), 'Parameter should contain PhoneNumberTo');

        exit(true);
    end;

    procedure SendContactMessage(Endpoint: enum "obc WA Endpoint"; Parameter: Dictionary of [enum "obc WA Param ContactMessage", Text]; var JsonResponse: JsonObject): Boolean;
    var
        Param: Enum "obc WA Param ContactMessage";
    begin
        Assert.AreEqual(Endpoint, Endpoint::"Facebook Graph", 'Endpoint should be equal to Facebook Graph');
        Assert.IsTrue(Parameter.ContainsKey(Param::BearerToken), 'Parameter should contain BearerToken');
        Assert.IsTrue(Parameter.ContainsKey(Param::PhoneNumberId), 'Parameter should contain PhoneNumberId');
        Assert.IsTrue(Parameter.ContainsKey(Param::PhoneNumberTo), 'Parameter should contain PhoneNumberTo');

        exit(true);
    end;

    var
        Assert: Codeunit Assert;
}