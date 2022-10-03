codeunit 77054 "obc WA Test Generic Msg" implements "obc WA IGenericMessage"
{

    procedure SendGenericMessage(Endpoint: enum "obc WA Endpoint"; Parameter: Dictionary of [enum "obc WA Param GenericMessage", Text]; var HttpResponse: HttpResponseMessage): Boolean;
    var
        Param: Enum "obc WA Param GenericMessage";
    begin
        Assert.AreEqual(Endpoint, Endpoint::"Facebook Graph", 'Endpoint should be equal to Facebook Graph');
        Assert.IsTrue(Parameter.ContainsKey(Param::BearerToken), 'Parameter should contain BearerToken');
        Assert.IsTrue(Parameter.ContainsKey(Param::PhoneNumberId), 'Parameter should contain PhoneNumberId');
        Assert.IsTrue(Parameter.ContainsKey(Param::Payload), 'Parameter should contain Payload');

        exit(true);
    end;


    procedure SendGenericMessage(Endpoint: enum "obc WA Endpoint"; Parameter: Dictionary of [enum "obc WA Param GenericMessage", Text]; var JsonResponse: JsonObject): Boolean;
    var
        Param: Enum "obc WA Param GenericMessage";
    begin
        Assert.AreEqual(Endpoint, Endpoint::"Facebook Graph", 'Endpoint should be equal to Facebook Graph');
        Assert.IsTrue(Parameter.ContainsKey(Param::BearerToken), 'Parameter should contain BearerToken');
        Assert.IsTrue(Parameter.ContainsKey(Param::PhoneNumberId), 'Parameter should contain PhoneNumberId');
        Assert.IsTrue(Parameter.ContainsKey(Param::Payload), 'Parameter should contain Payload');

        exit(true);
    end;



    var
        Assert: Codeunit Assert;
}