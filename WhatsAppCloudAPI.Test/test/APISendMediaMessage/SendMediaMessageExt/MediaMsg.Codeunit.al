codeunit 50210 "obc WA Test Media Msg" implements "obc WA IMediaMessage"
{
    procedure SendMediaMessage(Endpoint: enum "obc WA Endpoint"; MediaMessageType: enum "obc WA MediaMessage Type"; Parameter: Dictionary of [enum "obc WA Param MediaMessage", Text]; var HttpResponse: HttpResponseMessage): Boolean;
    var
        Param: Enum "obc WA Param MediaMessage";
    begin
        Assert.AreEqual(Endpoint, Endpoint::"Facebook Graph", 'Endpoint should be equal to Facebook Graph');
        Assert.AreEqual(MediaMessageType, MediaMessageType::image, 'MediaMessageType should be equal to image');

        Assert.IsTrue(Parameter.ContainsKey(Param::BearerToken), 'Parameter should contain BearerToken');
        Assert.IsTrue(Parameter.ContainsKey(Param::PhoneNumberId), 'Parameter should contain PhoneNumberId');
        Assert.IsTrue(Parameter.ContainsKey(Param::PhoneNumberTo), 'Parameter should contain PhoneNumberTo');
        Assert.IsTrue(Parameter.ContainsKey(Param::caption), 'Parameter should contain caption');
        Assert.IsTrue(Parameter.ContainsKey(Param::filename), 'Parameter should contain filename');
        Assert.IsTrue(Parameter.ContainsKey(Param::id), 'Parameter should contain id');
        Assert.IsTrue(Parameter.ContainsKey(Param::link), 'Parameter should contain link');
        Assert.IsTrue(Parameter.ContainsKey(Param::provider), 'Parameter should contain provider');

        exit(true);
    end;

    procedure SendMediaMessage(Endpoint: enum "obc WA Endpoint"; MediaMessageType: enum "obc WA MediaMessage Type"; Parameter: Dictionary of [enum "obc WA Param MediaMessage", Text]; var JsonResponse: JsonObject): Boolean;
    var
        Param: Enum "obc WA Param MediaMessage";
    begin
        Assert.AreEqual(Endpoint, Endpoint::"Facebook Graph", 'Endpoint should be equal to Facebook Graph');
        Assert.AreEqual(MediaMessageType, MediaMessageType::image, 'MediaMessageType should be equal to image');

        Assert.IsTrue(Parameter.ContainsKey(Param::BearerToken), 'Parameter should contain BearerToken');
        Assert.IsTrue(Parameter.ContainsKey(Param::PhoneNumberId), 'Parameter should contain PhoneNumberId');
        Assert.IsTrue(Parameter.ContainsKey(Param::PhoneNumberTo), 'Parameter should contain PhoneNumberTo');
        Assert.IsTrue(Parameter.ContainsKey(Param::caption), 'Parameter should contain caption');
        Assert.IsTrue(Parameter.ContainsKey(Param::filename), 'Parameter should contain filename');
        Assert.IsTrue(Parameter.ContainsKey(Param::id), 'Parameter should contain id');
        Assert.IsTrue(Parameter.ContainsKey(Param::link), 'Parameter should contain link');
        Assert.IsTrue(Parameter.ContainsKey(Param::provider), 'Parameter should contain provider');

        exit(true);
    end;

    var
        Assert: Codeunit Assert;

}