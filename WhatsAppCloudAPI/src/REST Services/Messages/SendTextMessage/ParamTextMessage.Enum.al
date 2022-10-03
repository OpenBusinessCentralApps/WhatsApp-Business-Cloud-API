enum 77004 "obc WA Param TextMessage"
{
    Extensible = true;
    Access = Public;

    //Paramenter Documentation: https://developers.facebook.com/docs/whatsapp/cloud-api/reference/messages#text-object

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
    value(3; "body")
    {
        //Mandatory
    }
    value(4; "preview_url")
    {
        //Optional
    }
}