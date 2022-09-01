codeunit 52505 "obc WA App Mgt."
{
    Access = Public;

    /// <summary>
    /// Gets the AppId of The Things Stack SDK
    /// </summary>
    /// <returns>AppId</returns>
    procedure GetAppId(): Guid
    var
        EmptyGuid: Guid;
        Info: ModuleInfo;
    begin
        if Info.Id() = EmptyGuid then
            NavApp.GetCurrentModuleInfo(Info);
        exit(Info.Id());
    end;

    /// <summary>
    /// Enables WebserviceCalls only in Sandbox enviroments
    /// </summary>
    procedure EnableWebserviceCallsInSandbox()
    var
        NavAppSettings: Record "NAV App Setting";
        EnviromentInformation: Codeunit "Environment Information";
        AppInfo: ModuleInfo;
    begin
        NavApp.GetCurrentModuleInfo(AppInfo);

        if EnviromentInformation.IsSandbox() then begin
            NavAppSettings."App ID" := AppInfo.Id();
            NavAppSettings."Allow HttpClient Requests" := true;
            if not NavAppSettings.Insert() then
                NavAppSettings.Modify();
        end;
    end;
}