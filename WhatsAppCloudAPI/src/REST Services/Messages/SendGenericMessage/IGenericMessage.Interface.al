interface "obc WA IGenericMessage"
{
    procedure SendGenericMessage(Endpoint: Enum "obc WA Endpoint"; Parameter: Dictionary of [Enum "obc WA Param GenericMessage", Text]; var HttpResponse: HttpResponseMessage): Boolean;
    procedure SendGenericMessage(Endpoint: Enum "obc WA Endpoint"; Parameter: Dictionary of [Enum "obc WA Param GenericMessage", Text]; var JsonResponse: JsonObject): Boolean;
}