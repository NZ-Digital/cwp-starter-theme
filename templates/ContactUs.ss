<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title></title>

    <style type="text/css">
        @import url("https://use.typekit.net/nbl1kem.css");
        p {
            font-family: Roboto,RobotoDraft,Helvetica,Arial,sans-serif;
            font-size: 18px;
        }
        .button-yellow {
            background-color: #f8cc46;
            padding: 10px 25px;
            font-weight: 600;
            border-radius: 50px;
            text-decoration: none;
            color: #040404 !important;
        }
    </style>
</head>
<body style="margin:0; background-color: #f8f8f8;">
<center>
    <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff" style="padding: 0;max-width: 900px; background: #ffffff none no-repeat center/cover;">
        <% if $EmailLogo %>
            <tr bgcolor="#ffffff" style="background-color: #ffffff;">
                <td bgcolor="#ffffff" align="left" height="100%" valign="top" style="padding: 20px 45px 20px 45px;background: #ffffff none no-repeat center/cover;">
                    <img src="$EmailLogo" width="150" height="auto" />
                </td>
            </tr>
        <% end_if %>
        <% if $EmailHeaderImage %>
            <tr bgcolor="#ffffff" style="background-color: #ffffff;">
                <td bgcolor="#ffffff" align="left" height="100%" valign="top" style="padding-top: 20px; padding-bottom: 10px;background: #ffffff none no-repeat center/cover;">
                    <img src="$EmailHeaderImage" width="600" height="auto">
                </td>
            </tr>
        <% end_if %>

        <tr bgcolor="#ffffff" style="background-color: #ffffff;">
            <td bgcolor="#ffffff" align="left" height="100%" valign="top" style="padding: 0 45px 40px 45px;background: #ffffff none no-repeat center/cover;">
                <% if $Salutation %>
                    <p style="margin: 0 0 20px 0; line-height: 1.6; font-weight: 600;">Hi {$Salutation},</p>
                <% end_if %>
                <p style="line-height: 1.6; margin-top: 5px;">$Message.RAW</p>
            </td>
        </tr>
        <tr>
            <% if $EmailFooterLogo %>
                <td bgcolor="#ffffff" align="left" height="100%" valign="top" style="padding: 0 45px 40px 45px;background: #ffffff none no-repeat center/cover;">

                    <table style="width: 100%;">
                        <tr bgcolor="#ffffff" style="background: #ffffff none no-repeat center/cover;">
                            <td bgcolor="#ffffff" style="background: #ffffff none no-repeat center/cover;">
                                <img src="$EmailFooterLogo" width="250" height="auto" />
                                <p style="margin-top: 10px;"><a href="$BaseHref" style="text-decoration: none;color:#040404 !important;font-weight: 600;">www.tewahitoi.com</a></p>
                            </td>
                            <td bgcolor="#ffffff" style="vertical-align: baseline; text-align: right;background: #ffffff none no-repeat center/cover;">
                                <div> <a href="$SocialURL0" style="margin-right: 15px"><img src="$Social0" width="30" height="auto" /></a><a href="$SocialURL1"><img src="$Social1" width="30" height="auto" /></a></div>
                            </td>
                        </tr>
                    </table>
                </td>
            <% end_if %>
        </tr>
    </table>
</center>
</body>
</html>
