permissionset 77050 "obc WA Test API"
{
    Assignable = true;
    IncludedPermissionSets = "obc WA CloudAPI";
    Permissions =
        codeunit "obc WA Test Install" = X,
        codeunit "obc WA Test Upgrade" = X;
}