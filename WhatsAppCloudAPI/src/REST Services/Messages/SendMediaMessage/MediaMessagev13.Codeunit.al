codeunit 52511 "obc WA Media Message v13" implements "obc WA IMediaMessage"
{
    Access = Internal;
    procedure SendMediaMessage(Endpoint: Enum "obc WA Endpoint"; MediaMessageType: Enum "obc WA MediaMessage Type"; Parameter: Dictionary of [enum "obc WA Param MediaMessage", Text]; var HttpResponse: HttpResponseMessage): Boolean;
    var
        RESTHelper: Codeunit "obc WA REST Helper";
        UriBuilder: Codeunit "Uri Builder";
        Uri: Codeunit Uri;
        MediaMessageParameter: Enum "obc WA Param MediaMessage";
        PayloadJSON: JsonObject;
    begin
        UriBuilder.Init(BuildAPIUrl(Endpoint, GetMandatoryValue(Parameter, MediaMessageParameter::PhoneNumberId)));
        UriBuilder.GetUri(Uri);

        PayloadJSON := BuildPayload(MediaMessageType, Parameter);

        if RESTHelper.PostWebRequest(Uri.GetAbsoluteUri(), GetMandatoryValue(Parameter, MediaMessageParameter::"BearerToken"), PayloadJSON, HttpResponse) then
            exit(HttpResponse.IsSuccessStatusCode());
    end;

    procedure SendMediaMessage(Endpoint: Enum "obc WA Endpoint"; MediaMessageType: Enum "obc WA MediaMessage Type"; Parameter: Dictionary of [enum "obc WA Param MediaMessage", Text]; var JsonResponse: JsonObject): Boolean;
    var
        RESTHelper: Codeunit "obc WA REST Helper";
        HttpResponse: HttpResponseMessage;
    begin
        SendMediaMessage(Endpoint, MediaMessageType, Parameter, HttpResponse);
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

    local procedure BuildPayload(MediaMessageType: Enum "obc WA MediaMessage Type"; ParameterDict: Dictionary of [Enum "obc WA Param MediaMessage", Text]) Payload: JsonObject
    var
        Parameter: Enum "obc WA Param MediaMessage";
        MediaMessageTypeAsText: Text;
        MediaJObject: JsonObject;
    begin
        MediaMessageTypeAsText := GetEnumValueName(MediaMessageType);

        Payload.Add('messaging_product', 'whatsapp');
        Payload.Add('recipient_type', 'individual');
        Payload.Add('to', GetMandatoryValue(ParameterDict, Parameter::PhoneNumberTo));
        Payload.Add('type', MediaMessageTypeAsText);

        //Build Media Object
        case MediaMessageType of
            MediaMessageType::audio:
                MediaJObject := BuildAudioMediaMessageObject(ParameterDict);
            MediaMessageType::document:
                MediaJObject := BuildDocumentMediaMessageObject(ParameterDict);
            MediaMessageType::image:
                MediaJObject := BuildImageMediaMessageObject(ParameterDict);
            MediaMessageType::sticker:
                MediaJObject := BuildStickerMediaMessageObject(ParameterDict);
            MediaMessageType::video:
                MediaJObject := BuildVideoMediaMessageObject(ParameterDict);
        end;

        Payload.Add(MediaMessageTypeAsText, MediaJObject);
        exit(Payload);
    end;

    local procedure GetMandatoryValue(ParameterDict: Dictionary of [Enum "obc WA Param MediaMessage", Text]; Parameter: Enum "obc WA Param MediaMessage") Param: Text;
    var
        ParameterMissingErr: Label 'Parameter %1 is mandatory.', Comment = '%1 = Parametervalue';
        ErrorMessage: Text;
    begin
        if not ParameterDict.Get(Parameter, Param) then begin
            ErrorMessage := StrSubstNo(ParameterMissingErr, Format(Parameter));
            Error(ErrorMessage);
        end;
    end;

    local procedure GetEnumValueName(MediaMessageType: Enum "obc WA MediaMessage Type"): Text
    var
        Index: Integer;
        ValueName: Text;
    begin
        Index := MediaMessageType.Ordinals().IndexOf(MediaMessageType.AsInteger());
        MediaMessageType.Names().Get(Index, ValueName);
        exit(ValueName);
    end;



    procedure BuildAudioMediaMessageObject(Parameter: Dictionary of [enum "obc WA Param MediaMessage", Text]): JsonObject;
    var
        MediaMessageParameter: Enum "obc WA Param MediaMessage";
        AudioJObject: JsonObject;

        Id: Text;
        Link: Text;

        ParameterErr: Label 'You can only define parameter "id" or "link. Not both at once';
    begin
        if Parameter.ContainsKey(MediaMessageParameter::id) and Parameter.ContainsKey(MediaMessageParameter::link) then
            Error(ParameterErr);

        //Id
        if Parameter.Get(MediaMessageParameter::id, Id) then
            AudioJObject.Add('id', Id);

        //Link
        if Parameter.Get(MediaMessageParameter::link, Link) then
            AudioJObject.Add('link', Link);

        exit(AudioJObject);
    end;

    procedure BuildDocumentMediaMessageObject(Parameter: Dictionary of [enum "obc WA Param MediaMessage", Text]): JsonObject;
    var
        MediaMessageParameter: Enum "obc WA Param MediaMessage";
        DocumentJObject: JsonObject;

        Id: Text;
        Link: Text;
        Caption: Text;
        FileName: Text;

        ParameterErr: Label 'You can only define parameter "id" or "link. Not both at once';
    begin
        if Parameter.ContainsKey(MediaMessageParameter::id) and Parameter.ContainsKey(MediaMessageParameter::link) then
            Error(ParameterErr);

        //Id
        if Parameter.Get(MediaMessageParameter::id, Id) then
            DocumentJObject.Add('id', Id);

        //Link
        if Parameter.Get(MediaMessageParameter::link, Link) then
            DocumentJObject.Add('link', Link);

        //Caption
        if Parameter.Get(MediaMessageParameter::caption, Caption) then
            DocumentJObject.Add('caption', Caption);

        //FileName
        if Parameter.Get(MediaMessageParameter::filename, FileName) then
            DocumentJObject.Add('filename', FileName);

        exit(DocumentJObject);
    end;

    procedure BuildImageMediaMessageObject(Parameter: Dictionary of [enum "obc WA Param MediaMessage", Text]): JsonObject;
    var
        MediaMessageParameter: Enum "obc WA Param MediaMessage";
        ImageJObject: JsonObject;

        Id: Text;
        Link: Text;
        Caption: Text;

        ParameterErr: Label 'You can only define parameter "id" or "link. Not both at once';
    begin
        if Parameter.ContainsKey(MediaMessageParameter::id) and Parameter.ContainsKey(MediaMessageParameter::link) then
            Error(ParameterErr);

        //Id
        if Parameter.Get(MediaMessageParameter::id, Id) then
            ImageJObject.Add('id', Id);

        //Link
        if Parameter.Get(MediaMessageParameter::link, Link) then
            ImageJObject.Add('link', Link);

        //Caption
        if Parameter.Get(MediaMessageParameter::caption, Caption) then
            ImageJObject.Add('caption', Caption);

        exit(ImageJObject);
    end;

    procedure BuildStickerMediaMessageObject(Parameter: Dictionary of [enum "obc WA Param MediaMessage", Text]): JsonObject;
    var
        MediaMessageParameter: Enum "obc WA Param MediaMessage";
        StickerJObject: JsonObject;

        Id: Text;
        Link: Text;

        ParameterErr: Label 'You can only define parameter "id" or "link. Not both at once';
    begin
        if Parameter.ContainsKey(MediaMessageParameter::id) and Parameter.ContainsKey(MediaMessageParameter::link) then
            Error(ParameterErr);

        //Id
        if Parameter.Get(MediaMessageParameter::id, Id) then
            StickerJObject.Add('id', Id);

        //Link
        if Parameter.Get(MediaMessageParameter::link, Link) then
            StickerJObject.Add('link', Link);

        exit(StickerJObject);
    end;

    procedure BuildVideoMediaMessageObject(Parameter: Dictionary of [enum "obc WA Param MediaMessage", Text]): JsonObject;
    var
        MediaMessageParameter: Enum "obc WA Param MediaMessage";
        VideoJObject: JsonObject;

        Id: Text;
        Link: Text;
        Caption: Text;

        ParameterErr: Label 'You can only define parameter "id" or "link. Not both at once';
    begin
        if Parameter.ContainsKey(MediaMessageParameter::id) and Parameter.ContainsKey(MediaMessageParameter::link) then
            Error(ParameterErr);

        //Id
        if Parameter.Get(MediaMessageParameter::id, Id) then
            VideoJObject.Add('id', Id);

        //Link
        if Parameter.Get(MediaMessageParameter::link, Link) then
            VideoJObject.Add('link', Link);

        //Caption
        if Parameter.Get(MediaMessageParameter::caption, Caption) then
            VideoJObject.Add('caption', Caption);

        exit(VideoJObject);
    end;
}