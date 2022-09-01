codeunit 52506 "obc WA REST Helper"
{
    Access = Public;

    procedure PostWebRequest(Url: Text; AuthToken: Text; Payload: JsonObject; var Response: HttpResponseMessage): Boolean
    var
        Client: HttpClient;
        Content: HttpContent;
        Headers: HttpHeaders;
        PayloadText: Text;
    begin
        // Add the payload to the content
        Payload.WriteTo(PayloadText);
        Content.WriteFrom(PayloadText);

        // Retrieve the contentHeaders associated with the content
        Content.GetHeaders(Headers);
        Headers.Clear();
        Headers.Add('Content-Type', 'application/json');

        Client.DefaultRequestHeaders.Add('Authorization', 'Bearer ' + AuthToken);
        exit(Client.Post(Url, Content, Response));
    end;

    procedure ProcessHttpResponseMessage(Response: HttpResponseMessage; var ResponseJObject: JsonObject): Boolean;
    var
        Result: Text;
    begin
        Clear(ResponseJObject);
        if Response.Content().ReadAs(Result) then
            ResponseJObject.ReadFrom(Result);

        exit(Response.IsSuccessStatusCode());
    end;
}