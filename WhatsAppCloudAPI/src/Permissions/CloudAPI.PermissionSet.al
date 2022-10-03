permissionset 77000 "obc WA CloudAPI"
{
    Caption = 'Whats App Cloud API';
    Access = Public;
    Assignable = true;

    Permissions =
        codeunit "obc WA App Mgt." = X,
        codeunit "obc WA Install" = X,
        codeunit "obc WA Upgrade" = X,

        codeunit "obc WA Default Endpoint" = X,
        codeunit "obc WA Graph Endpoint" = X,

        codeunit "obc WA API Messages" = X,
        codeunit "obc WA Text Message v13" = X,
        codeunit "obc WA Location Message v13" = X,
        codeunit "obc WA Media Message v13" = X,
        codeunit "obc WA Contact Message v13" = X,
        codeunit "obc WA Message Template v13" = X,
        codeunit "obc WA Interactive Message v13" = X,
        codeunit "obc WA Generic Message v13" = X,

        codeunit "obc WA REST Helper" = X;
}