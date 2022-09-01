interface "obc WA ITextMessage"
{
    procedure SendTextMessage(Endpoint: Enum "obc WA Endpoint"; Parameter: Dictionary of [Enum "obc WA Param TextMessage", Text]; var HttpResponse: HttpResponseMessage): Boolean;
    procedure SendTextMessage(Endpoint: Enum "obc WA Endpoint"; Parameter: Dictionary of [Enum "obc WA Param TextMessage", Text]; var JsonResponse: JsonObject): Boolean;
}