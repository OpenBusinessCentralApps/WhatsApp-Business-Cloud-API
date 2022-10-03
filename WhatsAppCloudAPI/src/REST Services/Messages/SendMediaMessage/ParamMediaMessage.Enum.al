enum 77010 "obc WA Param MediaMessage"
{
    Extensible = true;
    Access = Public;

    //Paramenter Documentation: https://developers.facebook.com/docs/whatsapp/cloud-api/reference/messages#media-object

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

    value(3; "id")
    {
        //Mandatory, when type is audio, document, image, sticker, or video and you are not using a link.
    }

    value(4; "link")
    {
        //Mandatory, when type is audio, document, image, sticker, or video and you are not using an uploaded media ID.
    }

    value(5; "caption")
    {
        //Optinal, Do not use with audio or sticker media.
    }

    value(6; "filename")
    {
        //Optional, Use only with document media.
    }

    value(7; "provider")
    {
        //Optinal, Only used for On-Premises API.
    }
}