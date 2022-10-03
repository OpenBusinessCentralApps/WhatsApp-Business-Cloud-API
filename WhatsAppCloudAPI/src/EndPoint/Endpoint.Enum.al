enum 77000 "obc WA Endpoint" implements "obc WA IEndpoint"
{
    Access = Public;
    Extensible = true;
    DefaultImplementation = "obc WA IEndpoint" = "obc WA Default Endpoint";

    value(0; "Facebook Graph")
    {
        Caption = 'Graph Endpoint';
        Implementation = "obc WA IEndpoint" = "obc WA Graph Endpoint";
    }
}