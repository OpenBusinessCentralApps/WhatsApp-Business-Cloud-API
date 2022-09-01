interface "obc WA IMessageTemplate"
{
    procedure SendMessageTemplate(Endpoint: Enum "obc WA Endpoint"; Parameter: Dictionary of [Enum "obc WA Param MessageTemplate", Text]; var HttpResponse: HttpResponseMessage): Boolean;
    procedure SendMessageTemplate(Endpoint: Enum "obc WA Endpoint"; Parameter: Dictionary of [Enum "obc WA Param MessageTemplate", Text]; var JsonResponse: JsonObject): Boolean;
}