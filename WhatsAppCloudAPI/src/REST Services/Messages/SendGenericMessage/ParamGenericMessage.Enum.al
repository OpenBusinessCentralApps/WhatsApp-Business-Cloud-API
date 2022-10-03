enum 77015 "obc WA Param GenericMessage"
{
    Extensible = true;
    Access = Public;

    //Paramenter Documentation: https://developers.facebook.com/docs/whatsapp/cloud-api/reference/messages

    value(0; PhoneNumberId)
    {
        //Mandatory
    }
    value(1; "BearerToken")
    {
        //Mandatory
    }
    value(3; "Payload")
    {
        //Mandatory, JObject
    }
}