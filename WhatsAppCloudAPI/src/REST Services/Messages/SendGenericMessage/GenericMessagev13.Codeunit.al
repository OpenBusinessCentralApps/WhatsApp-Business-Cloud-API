codeunit 77013 "obc WA Generic Message v13" implements "obc WA IGenericMessage"
{
    Access = Internal;
    procedure SendGenericMessage(Endpoint: Enum "obc WA Endpoint"; Parameter: Dictionary of [enum "obc WA Param GenericMessage", Text]; var HttpResponse: HttpResponseMessage): Boolean;
    var
        RESTHelper: Codeunit "obc WA REST Helper";
        UriBuilder: Codeunit "Uri Builder";
        Uri: Codeunit Uri;
        GenericMessageParameter: Enum "obc WA Param GenericMessage";
        PayloadJSON: JsonObject;
    begin
        UriBuilder.Init(BuildAPIUrl(Endpoint, GetMandatoryValue(Parameter, GenericMessageParameter::PhoneNumberId)));
        UriBuilder.GetUri(Uri);

        PayloadJSON := BuildPayload(Parameter);

        if RESTHelper.PostWebRequest(Uri.GetAbsoluteUri(), GetMandatoryValue(Parameter, GenericMessageParameter::"BearerToken"), PayloadJSON, HttpResponse) then
            exit(HttpResponse.IsSuccessStatusCode());
    end;

    procedure SendGenericMessage(Endpoint: Enum "obc WA Endpoint"; Parameter: Dictionary of [enum "obc WA Param GenericMessage", Text]; var JsonResponse: JsonObject): Boolean;
    var
        RESTHelper: Codeunit "obc WA REST Helper";
        HttpResponse: HttpResponseMessage;
    begin
        SendGenericMessage(Endpoint, Parameter, HttpResponse);
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

    local procedure BuildPayload(ParameterDict: Dictionary of [enum "obc WA Param GenericMessage", Text]) Payload: JsonObject
    var
        Parameter: Enum "obc WA Param GenericMessage";
    begin
        //Build Generic Object
        Payload.ReadFrom(GetMandatoryValue(ParameterDict, Parameter::Payload));
        exit(Payload);
    end;

    local procedure GetMandatoryValue(ParameterDict: Dictionary of [Enum "obc WA Param GenericMessage", Text]; Parameter: Enum "obc WA Param GenericMessage") Param: Text;
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