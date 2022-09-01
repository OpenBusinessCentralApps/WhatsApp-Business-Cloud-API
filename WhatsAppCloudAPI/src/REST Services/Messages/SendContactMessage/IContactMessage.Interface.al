interface "obc WA IContactMessage"
{
    procedure SendContactMessage(Endpoint: Enum "obc WA Endpoint"; Parameter: Dictionary of [Enum "obc WA Param ContactMessage", Text]; var HttpResponse: HttpResponseMessage): Boolean;
    procedure SendContactMessage(Endpoint: Enum "obc WA Endpoint"; Parameter: Dictionary of [Enum "obc WA Param ContactMessage", Text]; var JsonResponse: JsonObject): Boolean;
}