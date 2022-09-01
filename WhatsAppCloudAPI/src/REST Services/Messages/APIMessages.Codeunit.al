codeunit 52502 "obc WA API Messages"
{
    Access = Public;

    procedure SendMessageTemplate(Endpoint: Enum "obc WA Endpoint"; APIVersion: Enum "obc WA API MessageTemplate"; Parameter: Dictionary of [Enum "obc WA Param MessageTemplate", Text]; var JsonResponse: JsonObject): Boolean
    var
        IMessageTemplate: Interface "obc WA IMessageTemplate";
    begin
        IMessageTemplate := APIVersion;
        exit(IMessageTemplate.SendMessageTemplate(Endpoint, CopyParameter(Parameter), JsonResponse));
    end;

    procedure SendMessageTemplate(Endpoint: Enum "obc WA Endpoint"; APIVersion: Enum "obc WA API MessageTemplate"; Parameter: Dictionary of [Enum "obc WA Param MessageTemplate", Text]; var HttpResponse: HttpResponseMessage): Boolean
    var
        IMessageTemplate: Interface "obc WA IMessageTemplate";
    begin
        IMessageTemplate := APIVersion;
        exit(IMessageTemplate.SendMessageTemplate(Endpoint, CopyParameter(Parameter), HttpResponse));
    end;

    local procedure CopyParameter(Parameter: Dictionary of [Enum "obc WA Param MessageTemplate", Text]) ParameterCopy: Dictionary of [Enum "obc WA Param MessageTemplate", Text];
    var
        ParamKeys: List of [Enum "obc WA Param MessageTemplate"];
        MessageTemplateParameter: Enum "obc WA Param MessageTemplate";
    begin
        Clear(ParameterCopy);
        ParamKeys := Parameter.Keys;
        foreach MessageTemplateParameter in ParamKeys do
            ParameterCopy.Add(MessageTemplateParameter, Parameter.Get(MessageTemplateParameter));
    end;

    procedure SendTextMessage(Endpoint: Enum "obc WA Endpoint"; APIVersion: Enum "obc WA API TextMessage"; Parameter: Dictionary of [Enum "obc WA Param TextMessage", Text]; var JsonResponse: JsonObject): Boolean
    var
        ITextMessage: Interface "obc WA ITextMessage";
    begin
        ITextMessage := APIVersion;
        exit(ITextMessage.SendTextMessage(Endpoint, CopyParameter(Parameter), JsonResponse));
    end;

    procedure SendTextMessage(Endpoint: Enum "obc WA Endpoint"; APIVersion: Enum "obc WA API TextMessage"; Parameter: Dictionary of [Enum "obc WA Param TextMessage", Text]; var HttpResponse: HttpResponseMessage): Boolean
    var
        ITextMessage: Interface "obc WA ITextMessage";
    begin
        ITextMessage := APIVersion;
        exit(ITextMessage.SendTextMessage(Endpoint, CopyParameter(Parameter), HttpResponse));
    end;

    local procedure CopyParameter(Parameter: Dictionary of [Enum "obc WA Param TextMessage", Text]) ParameterCopy: Dictionary of [Enum "obc WA Param TextMessage", Text];
    var
        ParamKeys: List of [Enum "obc WA Param TextMessage"];
        TextMessageParameter: Enum "obc WA Param TextMessage";
    begin
        Clear(ParameterCopy);
        ParamKeys := Parameter.Keys;
        foreach TextMessageParameter in ParamKeys do
            ParameterCopy.Add(TextMessageParameter, Parameter.Get(TextMessageParameter));
    end;


    procedure SendLocationMessage(Endpoint: Enum "obc WA Endpoint"; APIVersion: Enum "obc WA API LocationMessage"; Parameter: Dictionary of [Enum "obc WA Param LocationMessage", Text]; var JsonResponse: JsonObject): Boolean
    var
        ILocationMessage: Interface "obc WA ILocationMessage";
    begin
        ILocationMessage := APIVersion;
        exit(ILocationMessage.SendLocationMessage(Endpoint, CopyParameter(Parameter), JsonResponse));
    end;

    procedure SendLocationMessage(Endpoint: Enum "obc WA Endpoint"; APIVersion: Enum "obc WA API LocationMessage"; Parameter: Dictionary of [Enum "obc WA Param LocationMessage", Text]; var HttpResponse: HttpResponseMessage): Boolean
    var
        ILocationMessage: Interface "obc WA ILocationMessage";
    begin
        ILocationMessage := APIVersion;
        exit(ILocationMessage.SendLocationMessage(Endpoint, CopyParameter(Parameter), HttpResponse));
    end;

    local procedure CopyParameter(Parameter: Dictionary of [Enum "obc WA Param LocationMessage", Text]) ParameterCopy: Dictionary of [Enum "obc WA Param LocationMessage", Text];
    var
        ParamKeys: List of [Enum "obc WA Param LocationMessage"];
        TextMessageParameter: Enum "obc WA Param LocationMessage";
    begin
        Clear(ParameterCopy);
        ParamKeys := Parameter.Keys;
        foreach TextMessageParameter in ParamKeys do
            ParameterCopy.Add(TextMessageParameter, Parameter.Get(TextMessageParameter));
    end;

    procedure SendContactMessage(Endpoint: Enum "obc WA Endpoint"; APIVersion: Enum "obc WA API ContactMessage"; Parameter: Dictionary of [Enum "obc WA Param ContactMessage", Text]; var JsonResponse: JsonObject): Boolean
    var
        IContactMessage: Interface "obc WA IContactMessage";
    begin
        IContactMessage := APIVersion;
        exit(IContactMessage.SendContactMessage(Endpoint, CopyParameter(Parameter), JsonResponse));
    end;

    procedure SendContactMessage(Endpoint: Enum "obc WA Endpoint"; APIVersion: Enum "obc WA API ContactMessage"; Parameter: Dictionary of [Enum "obc WA Param ContactMessage", Text]; var HttpResponse: HttpResponseMessage): Boolean
    var
        IContactMessage: Interface "obc WA IContactMessage";
    begin
        IContactMessage := APIVersion;
        exit(IContactMessage.SendContactMessage(Endpoint, CopyParameter(Parameter), HttpResponse));
    end;

    local procedure CopyParameter(Parameter: Dictionary of [Enum "obc WA Param ContactMessage", Text]) ParameterCopy: Dictionary of [Enum "obc WA Param ContactMessage", Text];
    var
        ParamKeys: List of [Enum "obc WA Param ContactMessage"];
        ContactMessageParameter: Enum "obc WA Param ContactMessage";
    begin
        Clear(ParameterCopy);
        ParamKeys := Parameter.Keys;
        foreach ContactMessageParameter in ParamKeys do
            ParameterCopy.Add(ContactMessageParameter, Parameter.Get(ContactMessageParameter));
    end;

    procedure SendMediaMessage(Endpoint: Enum "obc WA Endpoint"; APIVersion: Enum "obc WA API MediaMessage"; MediaMessageType: Enum "obc WA MediaMessage Type"; Parameter: Dictionary of [Enum "obc WA Param MediaMessage", Text]; var JsonResponse: JsonObject): Boolean
    var
        IMediaMessage: Interface "obc WA IMediaMessage";
    begin
        IMediaMessage := APIVersion;
        exit(IMediaMessage.SendMediaMessage(Endpoint, MediaMessageType, CopyParameter(Parameter), JsonResponse));
    end;

    procedure SendMediaMessage(Endpoint: Enum "obc WA Endpoint"; APIVersion: Enum "obc WA API MediaMessage"; MediaMessageType: Enum "obc WA MediaMessage Type"; Parameter: Dictionary of [Enum "obc WA Param MediaMessage", Text]; var HttpResponse: HttpResponseMessage): Boolean
    var
        IMediaMessage: Interface "obc WA IMediaMessage";
    begin
        IMediaMessage := APIVersion;
        exit(IMediaMessage.SendMediaMessage(Endpoint, MediaMessageType, CopyParameter(Parameter), HttpResponse));
    end;

    local procedure CopyParameter(Parameter: Dictionary of [Enum "obc WA Param MediaMessage", Text]) ParameterCopy: Dictionary of [Enum "obc WA Param MediaMessage", Text];
    var
        ParamKeys: List of [Enum "obc WA Param MediaMessage"];
        MediaMessageParameter: Enum "obc WA Param MediaMessage";
    begin
        Clear(ParameterCopy);
        ParamKeys := Parameter.Keys;
        foreach MediaMessageParameter in ParamKeys do
            ParameterCopy.Add(MediaMessageParameter, Parameter.Get(MediaMessageParameter));
    end;

    procedure SendInteractiveMessage(Endpoint: Enum "obc WA Endpoint"; APIVersion: Enum "obc WA API InteractiveMsg"; Parameter: Dictionary of [Enum "obc WA Param InteractiveMsg", Text]; var JsonResponse: JsonObject): Boolean
    var
        IInteractiveMessage: Interface "obc WA IInteractiveMessage";
    begin
        IInteractiveMessage := APIVersion;
        exit(IInteractiveMessage.SendInteractiveMessage(Endpoint, CopyParameter(Parameter), JsonResponse));
    end;

    procedure SendInteractiveMessage(Endpoint: Enum "obc WA Endpoint"; APIVersion: Enum "obc WA API InteractiveMsg"; Parameter: Dictionary of [Enum "obc WA Param InteractiveMsg", Text]; var HttpResponse: HttpResponseMessage): Boolean
    var
        IInteractiveMessage: Interface "obc WA IInteractiveMessage";
    begin
        IInteractiveMessage := APIVersion;
        exit(IInteractiveMessage.SendInteractiveMessage(Endpoint, CopyParameter(Parameter), HttpResponse));
    end;

    local procedure CopyParameter(Parameter: Dictionary of [Enum "obc WA Param InteractiveMsg", Text]) ParameterCopy: Dictionary of [Enum "obc WA Param InteractiveMsg", Text];
    var
        ParamKeys: List of [Enum "obc WA Param InteractiveMsg"];
        ContactMessageParameter: Enum "obc WA Param InteractiveMsg";
    begin
        Clear(ParameterCopy);
        ParamKeys := Parameter.Keys;
        foreach ContactMessageParameter in ParamKeys do
            ParameterCopy.Add(ContactMessageParameter, Parameter.Get(ContactMessageParameter));
    end;

    procedure SendGenericMessage(Endpoint: Enum "obc WA Endpoint"; APIVersion: Enum "obc WA API GenericMessage"; Parameter: Dictionary of [Enum "obc WA Param GenericMessage", Text]; var JsonResponse: JsonObject): Boolean
    var
        IGenericMessage: Interface "obc WA IGenericMessage";
    begin
        IGenericMessage := APIVersion;
        exit(IGenericMessage.SendGenericMessage(Endpoint, CopyParameter(Parameter), JsonResponse));
    end;

    procedure SendGenericMessage(Endpoint: Enum "obc WA Endpoint"; APIVersion: Enum "obc WA API GenericMessage"; Parameter: Dictionary of [Enum "obc WA Param GenericMessage", Text]; var HttpResponse: HttpResponseMessage): Boolean
    var
        IGenericMessage: Interface "obc WA IGenericMessage";
    begin
        IGenericMessage := APIVersion;
        exit(IGenericMessage.SendGenericMessage(Endpoint, CopyParameter(Parameter), HttpResponse));
    end;

    local procedure CopyParameter(Parameter: Dictionary of [Enum "obc WA Param GenericMessage", Text]) ParameterCopy: Dictionary of [Enum "obc WA Param GenericMessage", Text];
    var
        ParamKeys: List of [Enum "obc WA Param GenericMessage"];
        GenericMessageMessageParameter: Enum "obc WA Param GenericMessage";
    begin
        Clear(ParameterCopy);
        ParamKeys := Parameter.Keys;
        foreach GenericMessageMessageParameter in ParamKeys do
            ParameterCopy.Add(GenericMessageMessageParameter, Parameter.Get(GenericMessageMessageParameter));
    end;
}