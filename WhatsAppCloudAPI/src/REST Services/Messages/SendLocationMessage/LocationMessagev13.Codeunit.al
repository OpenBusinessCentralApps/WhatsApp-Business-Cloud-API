codeunit 77009 "obc WA Location Message v13" implements "obc WA ILocationMessage"
{
    Access = Internal;
    procedure SendLocationMessage(Endpoint: Enum "obc WA Endpoint"; Parameter: Dictionary of [enum "obc WA Param LocationMessage", Text]; var HttpResponse: HttpResponseMessage): Boolean;
    var
        RESTHelper: Codeunit "obc WA REST Helper";
        UriBuilder: Codeunit "Uri Builder";
        Uri: Codeunit Uri;
        LocationMessageParameter: Enum "obc WA Param LocationMessage";
        PayloadJSON: JsonObject;
    begin
        UriBuilder.Init(BuildAPIUrl(Endpoint, GetMandatoryValue(Parameter, LocationMessageParameter::PhoneNumberId)));
        UriBuilder.GetUri(Uri);

        PayloadJSON := BuildPayload(Parameter);

        if RESTHelper.PostWebRequest(Uri.GetAbsoluteUri(), GetMandatoryValue(Parameter, LocationMessageParameter::"BearerToken"), PayloadJSON, HttpResponse) then
            exit(HttpResponse.IsSuccessStatusCode());
    end;

    procedure SendLocationMessage(Endpoint: Enum "obc WA Endpoint"; Parameter: Dictionary of [enum "obc WA Param LocationMessage", Text]; var JsonResponse: JsonObject): Boolean;
    var
        RESTHelper: Codeunit "obc WA REST Helper";
        HttpResponse: HttpResponseMessage;
    begin
        SendLocationMessage(Endpoint, Parameter, HttpResponse);
        exit(RESTHelper.ProcessHttpResponseMessage(HttpResponse, JsonResponse));
    end;

    local procedure BuildAPIUrl(Endpoint: Enum "obc WA Endpoint"; PhoneNumberId: Text): Text
    var
        IEndpoint: Interface "obc WA IEndpoint";
        APIVersionLbl: Label '/v13.0/', Locked = true;
        HttpBindingLbl: Label '/messages', Locked = true;
        Builder: TextBuilder;
    begin
        IEndpoint := Endpoint;
        Builder.Append(IEndpoint.GetAPIEndpoint());
        Builder.Append(APIVersionLbl);
        Builder.Append(PhoneNumberId);
        Builder.Append(HttpBindingLbl);
        exit(Builder.ToText());
    end;

    local procedure BuildPayload(ParameterDict: Dictionary of [enum "obc WA Param LocationMessage", Text]) Payload: JsonObject
    var
        Parameter: Enum "obc WA Param LocationMessage";

        LocationJObject: JsonObject;

        Name: Text;
        Address: Text;
    begin
        Payload.Add('messaging_product', 'whatsapp');
        Payload.Add('recipient_type', 'individual');
        Payload.Add('to', GetMandatoryValue(ParameterDict, Parameter::PhoneNumberTo));
        Payload.Add('type', 'location');

        //Build Location Object
        LocationJObject.Add('longitude', GetMandatoryValue(ParameterDict, Parameter::longitude));
        LocationJObject.Add('latitude', GetMandatoryValue(ParameterDict, Parameter::latitude));

        //Get optional parameter
        if ParameterDict.Get(Parameter::name, Name) then
            LocationJObject.Add('name', Name);

        if ParameterDict.Get(Parameter::address, Address) then
            LocationJObject.Add('address', Address);


        Payload.Add('location', LocationJObject);
        exit(Payload);
    end;

    local procedure GetMandatoryValue(ParameterDict: Dictionary of [Enum "obc WA Param LocationMessage", Text]; Parameter: Enum "obc WA Param LocationMessage") Param: Text;
    var
        ParameterMissingErr: Label 'Parameter %1 is mandatory.', Comment = '%1 = Parametervalue';
        ErrorMessage: Text;
    begin
        if not ParameterDict.Get(Parameter, Param) then begin
            ErrorMessage := StrSubstNo(ParameterMissingErr, Format(Parameter));
            Error(ErrorMessage);
        end;
    end;
}