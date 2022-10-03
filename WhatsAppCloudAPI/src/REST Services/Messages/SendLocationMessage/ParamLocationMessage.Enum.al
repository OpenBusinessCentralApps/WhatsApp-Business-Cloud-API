enum 77005 "obc WA Param LocationMessage"
{
    Extensible = true;
    Access = Public;

    //Paramenter Documentation: https://developers.facebook.com/docs/whatsapp/cloud-api/reference/messages#location-object

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
    value(3; "longitude")
    {
        //Mandatory
    }
    value(4; "latitude")
    {
        //Mandatory
    }

    value(5; "name")
    {
        //Optional
    }

    value(6; "address")
    {
        //Optinal
    }
}