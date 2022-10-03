codeunit 77000 "obc WA Graph Endpoint" implements "obc WA IEndpoint"
{
    Access = Internal;

    procedure GetAPIEndpoint(): Text;
    var
        lAPIEndpointTxt: Label 'https://graph.facebook.com', Locked = true;
    begin
        exit(lAPIEndpointTxt);
    end;
}