interface "obc WA IInteractiveMessage"
{
    procedure SendInteractiveMessage(Endpoint: Enum "obc WA Endpoint"; Parameter: Dictionary of [Enum "obc WA Param InteractiveMsg", Text]; var HttpResponse: HttpResponseMessage): Boolean;
    procedure SendInteractiveMessage(Endpoint: Enum "obc WA Endpoint"; Parameter: Dictionary of [Enum "obc WA Param InteractiveMsg", Text]; var JsonResponse: JsonObject): Boolean;
}