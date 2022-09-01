codeunit 52501 "obc WA Default Endpoint" implements "obc WA IEndpoint"
{
    Access = Internal;

    procedure GetAPIEndpoint(): Text;
    begin
        Error(NotImplementedErr);
    end;

    var
        NotImplementedErr: Label 'Not implemented';
}