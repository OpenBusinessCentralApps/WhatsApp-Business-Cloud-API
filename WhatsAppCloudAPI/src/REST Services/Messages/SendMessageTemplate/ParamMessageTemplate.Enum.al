enum 77002 "obc WA Param MessageTemplate"
{
    Extensible = true;
    Access = Public;

    //Paramenter Documentation: https://developers.facebook.com/docs/whatsapp/cloud-api/reference/messages#template-object 

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
    value(3; "TemplateName")
    {
        //Mandatory
    }
    value(4; "LanguageCode")
    {
        //Mandatory
    }
    value(5; "components")
    {
        //Optional, JArray
    }
}