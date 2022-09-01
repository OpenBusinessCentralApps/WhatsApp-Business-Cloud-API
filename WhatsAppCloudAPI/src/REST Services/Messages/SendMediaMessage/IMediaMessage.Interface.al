interface "obc WA IMediaMessage"
{
    procedure SendMediaMessage(Endpoint: Enum "obc WA Endpoint"; MediaMessageType: Enum "obc WA MediaMessage Type"; Parameter: Dictionary of [Enum "obc WA Param MediaMessage", Text]; var HttpResponse: HttpResponseMessage): Boolean;
    procedure SendMediaMessage(Endpoint: Enum "obc WA Endpoint"; MediaMessageType: Enum "obc WA MediaMessage Type"; Parameter: Dictionary of [Enum "obc WA Param MediaMessage", Text]; var JsonResponse: JsonObject): Boolean;
}