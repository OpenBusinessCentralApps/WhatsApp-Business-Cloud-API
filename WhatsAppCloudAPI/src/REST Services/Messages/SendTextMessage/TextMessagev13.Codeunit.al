codeunit 52508 "obc WA Text Message v13" implements "obc WA ITextMessage"
{
    Access = Internal;
    procedure SendTextMessage(Endpoint: Enum "obc WA Endpoint"; Parameter: Dictionary of [enum "obc WA Param TextMessage", Text]; var HttpResponse: HttpResponseMessage): Boolean;
    var
        RESTHelper: Codeunit "obc WA REST Helper";
        UriBuilder: Codeunit "Uri Builder";
        Uri: Codeunit Uri;
        TextMessageParameter: Enum "obc WA Param TextMessage";
        PayloadJSON: JsonObject;
    begin
        UriBuilder.Init(BuildAPIUrl(Endpoint, GetMandatoryValue(Parameter, TextMessageParameter::PhoneNumberId)));
        UriBuilder.GetUri(Uri);

        PayloadJSON := BuildPayload(Parameter);

        if RESTHelper.PostWebRequest(Uri.GetAbsoluteUri(), GetMandatoryValue(Parameter, TextMessageParameter::"BearerToken"), PayloadJSON, HttpResponse) then
            exit(HttpResponse.IsSuccessStatusCode());
    end;

    procedure SendTextMessage(Endpoint: Enum "obc WA Endpoint"; Parameter: Dictionary of [enum "obc WA Param TextMessage", Text]; var JsonResponse: JsonObject): Boolean;
    var
        RESTHelper: Codeunit "obc WA REST Helper";
        HttpResponse: HttpResponseMessage;
    begin
        SendTextMessage(Endpoint, Parameter, HttpResponse);
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

    local procedure BuildPayload(ParameterDict: Dictionary of [enum "obc WA Param TextMessage", Text]) Payload: JsonObject
    var
        Parameter: Enum "obc WA Param TextMessage";


        TextJObject: JsonObject;

        Preview_url: Text;
    begin
        Payload.Add('messaging_product', 'whatsapp');
        Payload.Add('recipient_type', 'individual');
        Payload.Add('to', GetMandatoryValue(ParameterDict, Parameter::PhoneNumberTo));
        Payload.Add('type', 'text');

        //Build Text Object
        TextJObject.Add('body', GetMandatoryValue(ParameterDict, Parameter::body));

        //Get optional parameter
        if ParameterDict.Get(Parameter::preview_url, Preview_url) then
            TextJObject.Add('preview_url', Preview_url);

        Payload.Add('text', TextJObject);

        exit(Payload);
    end;

    local procedure GetMandatoryValue(ParameterDict: Dictionary of [Enum "obc WA Param TextMessage", Text]; Parameter: Enum "obc WA Param TextMessage") Param: Text;
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