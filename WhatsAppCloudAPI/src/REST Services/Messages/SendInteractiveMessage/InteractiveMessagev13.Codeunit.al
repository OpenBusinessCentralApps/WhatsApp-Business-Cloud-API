codeunit 77012 "obc WA Interactive Message v13" implements "obc WA IInteractiveMessage"
{
    Access = Internal;
    procedure SendInteractiveMessage(Endpoint: Enum "obc WA Endpoint"; Parameter: Dictionary of [enum "obc WA Param InteractiveMsg", Text]; var HttpResponse: HttpResponseMessage): Boolean;
    var
        RESTHelper: Codeunit "obc WA REST Helper";
        UriBuilder: Codeunit "Uri Builder";
        Uri: Codeunit Uri;
        InteractiveMsgParameter: Enum "obc WA Param InteractiveMsg";
        PayloadJSON: JsonObject;
    begin
        UriBuilder.Init(BuildAPIUrl(Endpoint, GetMandatoryValue(Parameter, InteractiveMsgParameter::PhoneNumberId)));
        UriBuilder.GetUri(Uri);

        PayloadJSON := BuildPayload(Parameter);

        if RESTHelper.PostWebRequest(Uri.GetAbsoluteUri(), GetMandatoryValue(Parameter, InteractiveMsgParameter::"BearerToken"), PayloadJSON, HttpResponse) then
            exit(HttpResponse.IsSuccessStatusCode());
    end;

    procedure SendInteractiveMessage(Endpoint: Enum "obc WA Endpoint"; Parameter: Dictionary of [enum "obc WA Param InteractiveMsg", Text]; var JsonResponse: JsonObject): Boolean;
    var
        RESTHelper: Codeunit "obc WA REST Helper";
        HttpResponse: HttpResponseMessage;
    begin
        SendInteractiveMessage(Endpoint, Parameter, HttpResponse);
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

    local procedure BuildPayload(ParameterDict: Dictionary of [enum "obc WA Param InteractiveMsg", Text]) Payload: JsonObject
    var
        Parameter: Enum "obc WA Param InteractiveMsg";

        InteractiveJObject: JsonObject;
    begin
        Payload.Add('messaging_product', 'whatsapp');
        Payload.Add('recipient_type', 'individual');
        Payload.Add('to', GetMandatoryValue(ParameterDict, Parameter::PhoneNumberTo));
        Payload.Add('type', 'interactive');

        //Parse Interactive JObject
        InteractiveJObject.ReadFrom(GetMandatoryValue(ParameterDict, Parameter::interactive));
        Payload.Add('interactive', InteractiveJObject);

        exit(Payload);
    end;

    local procedure GetMandatoryValue(ParameterDict: Dictionary of [Enum "obc WA Param InteractiveMsg", Text]; Parameter: Enum "obc WA Param InteractiveMsg") Param: Text;
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