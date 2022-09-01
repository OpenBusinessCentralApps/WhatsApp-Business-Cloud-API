codeunit 52507 "obc WA Message Template v13" implements "obc WA IMessageTemplate"
{
    Access = Internal;
    procedure SendMessageTemplate(Endpoint: Enum "obc WA Endpoint"; Parameter: Dictionary of [enum "obc WA Param MessageTemplate", Text]; var HttpResponse: HttpResponseMessage): Boolean;
    var
        RESTHelper: Codeunit "obc WA REST Helper";
        UriBuilder: Codeunit "Uri Builder";
        Uri: Codeunit Uri;
        MessageTemplateParameter: Enum "obc WA Param MessageTemplate";
        PayloadJSON: JsonObject;
    begin
        UriBuilder.Init(BuildAPIUrl(Endpoint, GetMandatoryValue(Parameter, MessageTemplateParameter::PhoneNumberId)));
        UriBuilder.GetUri(Uri);

        PayloadJSON := BuildPayload(Parameter);

        if RESTHelper.PostWebRequest(Uri.GetAbsoluteUri(), GetMandatoryValue(Parameter, MessageTemplateParameter::"BearerToken"), PayloadJSON, HttpResponse) then
            exit(HttpResponse.IsSuccessStatusCode());
    end;

    procedure SendMessageTemplate(Endpoint: Enum "obc WA Endpoint"; Parameter: Dictionary of [enum "obc WA Param MessageTemplate", Text]; var JsonResponse: JsonObject): Boolean;
    var
        RESTHelper: Codeunit "obc WA REST Helper";
        HttpResponse: HttpResponseMessage;
    begin
        SendMessageTemplate(Endpoint, Parameter, HttpResponse);
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


    local procedure BuildPayload(ParameterDict: Dictionary of [enum "obc WA Param MessageTemplate", Text]) Payload: JsonObject
    var
        Parameter: Enum "obc WA Param MessageTemplate";

        Components: Text;
        ComponentsJArray: JsonArray;

        TemplateJObject: JsonObject;
        LanguageJObject: JsonObject;
    begin
        Payload.Add('messaging_product', 'whatsapp');
        Payload.Add('recipient_type', 'individual');
        Payload.Add('to', GetMandatoryValue(ParameterDict, Parameter::PhoneNumberTo));
        Payload.Add('type', 'template');

        //Build Template Object
        TemplateJObject.Add('name', GetMandatoryValue(ParameterDict, Parameter::TemplateName));

        LanguageJObject.Add('code', GetMandatoryValue(ParameterDict, Parameter::LanguageCode));
        TemplateJObject.Add('language', LanguageJObject);

        //Get optional parameter
        if ParameterDict.Get(Parameter::components, Components) then begin
            ComponentsJArray.ReadFrom(Components);
            TemplateJObject.Add('components', ComponentsJArray);
        end;

        Payload.Add('template', TemplateJObject);

        exit(Payload);
    end;

    local procedure GetMandatoryValue(ParameterDict: Dictionary of [Enum "obc WA Param MessageTemplate", Text]; Parameter: Enum "obc WA Param MessageTemplate") Param: Text;
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