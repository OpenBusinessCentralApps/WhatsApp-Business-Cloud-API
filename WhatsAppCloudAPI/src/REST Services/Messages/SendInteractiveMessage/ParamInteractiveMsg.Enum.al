enum 77013 "obc WA Param InteractiveMsg"
{
    Extensible = true;
    Access = Public;

    //Paramenter Documentation: https://developers.facebook.com/docs/whatsapp/cloud-api/reference/messages#interactive-object

    value(0; PhoneNumberId)
    {
        //Mandatory
    }
    value(1; "BearerToken")
    {
        //Mandatory
    }
    value(2; "PhoneNumberTo")
    {
        //Mandatory
    }
    value(3; "interactive")
    {
        //Mandatory, JObject
    }
}