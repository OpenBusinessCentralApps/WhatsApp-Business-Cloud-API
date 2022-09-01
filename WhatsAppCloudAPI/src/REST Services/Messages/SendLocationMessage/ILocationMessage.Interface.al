interface "obc WA ILocationMessage"
{
    procedure SendLocationMessage(Endpoint: Enum "obc WA Endpoint"; Parameter: Dictionary of [Enum "obc WA Param LocationMessage", Text]; var HttpResponse: HttpResponseMessage): Boolean;
    procedure SendLocationMessage(Endpoint: Enum "obc WA Endpoint"; Parameter: Dictionary of [Enum "obc WA Param LocationMessage", Text]; var JsonResponse: JsonObject): Boolean;
}