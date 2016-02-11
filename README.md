# Based off of question2answer-custom-docker
Question 2 Answer image with some good plugins installed

## Installed plugins
```java
drwxr-xr-x  2 root root   73 Oct 26 22:41 basic-adsense
drwxr-xr-x  3 root root 4096 Feb 11 06:32 email-formating
drwxr-xr-x  2 root root   72 Oct 26 22:41 event-logger
drwxr-xr-x  2 root root  138 Oct 26 22:41 example-page
drwxr-xr-x  2 root root  109 Oct 26 22:41 mouseover-layer
drwxr-xr-x  2 root root  105 Oct 26 22:41 opensearch-support
drwxr-xr-x  3 root root 4096 Feb 10 22:56 q2a-backup
drwxr-xr-x  3 root root 4096 Feb 10 22:57 q2a-badges
drwxr-xr-x  3 root root 4096 Feb 10 22:57 q2a-comment-voting
drwxr-xr-x  4 root root 4096 Feb 10 22:56 q2a-delete-hidden-posts
drwxr-xr-x  3 root root 4096 Feb 10 22:56 q2a-edit-history
drwxr-xr-x  4 root root  141 Feb 10 23:59 q2a-email-notification
drwxr-xr-x  4 root root 4096 Feb 10 22:56 q2a-markdown-editor
drwxr-xr-x  5 root root 4096 Feb 10 22:55 q2a-open-login
drwxr-xr-x  3 root root  122 Feb 10 22:56 q2a-plugin-open-questions
drwxr-xr-x  3 root root 4096 Feb 10 22:56 q2a-poll
drwxr-xr-x  3 root root  134 Feb 10 22:56 q2a-post-merge
drwxr-xr-x  3 root root 4096 Feb 10 22:56 q2a-role-markers
drwxr-xr-x  2 root root   65 Feb 10 22:55 q2a-slack
drwxr-xr-x  4 root root  121 Feb 10 22:56 q2a-smilies
drwxr-xr-x  4 root root 4096 Feb 10 22:56 q2a-sort-answers
drwxr-xr-x  4 root root 4096 Feb 10 22:57 q2a-syntax-highlighter
drwxr-xr-x  3 root root 4096 Feb 10 22:56 q2a-tagging-tools
drwxr-xr-x  3 root root 4096 Feb 10 22:56 q2apro-ajax-usersearch
drwxr-xr-x  3 root root  155 Feb 10 22:56 q2apro-comment-to-answer
drwxr-xr-x  3 root root  137 Feb 10 22:56 q2apro-list-uploads-page
drwxr-xr-x  3 root root  121 Feb 10 22:56 q2apro-most-active-users
drwxr-xr-x  3 root root 4096 Feb 10 22:56 q2apro-prevent-simultaneous-edits
drwxr-xr-x  3 root root 4096 Feb 10 22:56 q2apro-recent-events-widget
drwxr-xr-x  3 root root 4096 Feb 10 22:56 q2apro-warn-on-leave
drwxr-xr-x  2 root root  100 Oct 26 22:41 recaptcha-captcha
drwxr-xr-x  2 root root   69 Oct 26 22:41 tag-cloud-widget
drwxr-xr-x  3 root root 4096 Feb 10 22:57 wysiwyg-editor
drwxr-xr-x  2 root root   71 Oct 26 22:41 xml-sitemap
```

## PHP Mailer SSL Fix
http://stackoverflow.com/questions/26827192/phpmailer-ssl3-get-server-certificatecertificate-verify-failed

Edit: /var/www/html/qa-include/vendor/PHPMailer/class.smtp.php

Add in the options ssl

```php
public function connect($host, $port = null, $timeout = 30, $options = array()) {

           $options['ssl'] = array('verify_peer' => false, 'verify_peer_name' => false, 'allow_self_signed' => true);
```

## Slack Plugin Configuration

https://github.com/LeonardChallis/q2a-slack

Simply place the q2a-slack folder into the qa-plugin folder, then change the three configuration variables in qa-plugin/q2a-slack/qa-slack.php.

```php
    private $siteUrl = 'http://clm-aus-012171/';
    private $slackUrl = 'https://hooks.slack.com/services/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';
    private $linkMessage = 'View on Q2A Site';
```

Remove icon_emoji and username

```php
 $data = array('text' => $message, 'icon_emoji' => ':question:', 'username' => 'ombrelle-ask');
```

From <https://github.com/LeonardChallis/q2a-slack> 

In Slack for a channel add custom integration->incoming webhooks
	• webhook url
	• set customize name
	• set custom icon
	
## HTML Email Template

In plugin section, modify HTML background color codes
For image, use scp and docker cp to get new logo to container



HTML

```html
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-1252">
<style type="text/css">
body, td {
margin: 0px;
}

bodytemplate body, td {
font-family: Verdana, Arial, Helvetica, sans-serif;
font-size: 11px;
color: #000000;
}

bodytemplate a {
font-family: Verdana, Arial, Helvetica, sans-serif;
font-size: 11px;
color: #003399;
text-decoration:underline;
}

bodytemplate a:visited {
font-size: 11px;
color: #003399;
text-decoration:underline;
}

bodytemplate a:hover {
font-size: 11px;
color: #003399;
text-decoration:none;
}

openhtml {
color: #666666;
font-size: 10px;
height: 26px;
}

openhtml a {
font-family: Verdana, Arial, Helvetica, sans-serif;
color: #666666;
font-size: 10px;
text-decoration: underline;
}

openhtml a:visited {
color: #666666;
font-size: 10px;
text-decoration: underline;
}

openhtml a:hover {
color: #666666;
font-size: 10px;
text-decoration: none;
}

ECOinhoud a {
font-family: Verdana, Arial, Helvetica, sans-serif;
color: #003399;
font-size: 11px;
text-decoration: underline;
}

ECOinhoud a:visited {
color: #003399;
font-size: 11px;
text-decoration: underline;
}

ECOinhoud a:hover {
color: #003399;
font-size: 11px;
text-decoration: none;
}

b, strong {
color:#1b8b35;
font-weight:bold;
}

h2 {
font-size:14px;
color:#003399;
}

afmelden {
color: #ffffff;
font-size: 11px;
height: 20px;
}

afmelden a {
font-family: Verdana, Arial, Helvetica, sans-serif;
color: #ffffff;
font-size: 11px;
text-decoration: underline;
}

afmelden a:visited {
color: #ffffff;
font-size: 11px;
text-decoration: underline;
}

afmelden a:hover {
color: #ffffff;
font-size: 11px;
text-decoration: none;
}

emailadres {
color: #666666;
font-size: 10px;
height: 26px;
}

emailadres a {
font-family: Verdana, Arial, Helvetica, sans-serif;
color: #666666;
font-size: 10px;
text-decoration: underline;
}

emailadres a:visited {
color: #666666;
font-size: 10px;
text-decoration: underline;
}

emailadres a:hover {
color: #666666;
font-size: 10px;
text-decoration: none;
}

bodytemplate {
text-align: center;
}

mpFormDescription { padding-left:2px; padding-right:2px; margin-top: 0px; padding-top: 0px; text-align: center;}

mpFormAnswer { text-align: center;}

mpFormLabel { vertical-align:top;}

mpFormField { vertical-align:top;}

mpTextArea { width:200px; height:70px;}

mpRssTitle {
font-size:12px;
margin-bottom:0px;
}

mpRssClickThrough a, .mpRssClickThrough a:hover {
color:#000000;
text-decoration:underline;
}

mpRssClickThrough a:visited {
color:#000000;
text-decoration:underline;
}</style>
</head>
<body><style type="text/css">
body, td {
margin: 0px;
}

bodytemplate body, td {
font-family: Verdana, Arial, Helvetica, sans-serif;
font-size: 11px;
color: #000000;
}

bodytemplate a {
font-family: Verdana, Arial, Helvetica, sans-serif;
font-size: 11px;
color: #003399;
text-decoration:underline;
}

openhtml {
color: #666666;
font-size: 10px;
height: 26px;
}

openhtml a {
font-family: Verdana, Arial, Helvetica, sans-serif;
color: #666666;
font-size: 10px;
text-decoration: underline;
}

b, strong {
color:#1b8b35;
font-weight:bold;
}

h2 {
font-size:14px;
color:#003399;
}

afmelden {
color: #ffffff;
font-size: 11px;
height: 20px;
}



emailadres {
color: #666666;
font-size: 10px;
height: 26px;
}


bodytemplate {
text-align: center;
}

mpFormDescription { padding-left:2px; padding-right:2px; margin-top: 0px; padding-top: 0px; text-align: center;}

mpFormAnswer { text-align: center;}

mpFormLabel { vertical-align:top;}

mpFormField { vertical-align:top;}

mpTextArea { width:200px; height:70px;}

mpRssTitle {
font-size:12px;
margin-bottom:0px;
}

mpRssClickThrough a, .mpRssClickThrough a:hover {
color:#000000;
text-decoration:underline;
}

mpRssClickThrough a:visited {
color:#000000;
text-decoration:underline;
}</style>
 
<table height="100%" cellspacing="0" cellpadding="0" width="100%" border="0">

<tbody>
<tr>
<td class="bodytemplate" valign="top" bgcolor="#ffffff" style="text-align: center">
<table cellspacing="0" cellpadding="0" width="600" align="center" border="0">
<tbody>
<tr>
<td align="left" bgcolor="#ffffff" colspan="5"><img height="150" alt="" width="300" border="0" src="^site_url/qa-plugin/email-formating/wind_energy.jpg"></td>
</tr>
<tr>
<td valign="top" align="left" width="10" bgcolor="#a7a9ac"> </td>
<td class="afmelden" align="left" bgcolor="#a7a9ac" colspan="4" height="20" style="font-size: 11px; color: rgb(255,255,255); font-family: Verdana,Arial,Helvetica,sans-serif">   <a target="_blank" href="^site_url">^site_title</a>                                                             <a target="_blank" href="^site_urlfeedback">Unsubscribe</a></td>

</tr>
<tr>
<td colspan="5"><img height="23" alt="" width="600" border="0" src="^site_url/qa-plugin/email-formating/header2.gif"></td>
</tr>
<tr>
<td valign="top" align="left" width="10" bgcolor="#fff9e8"> </td>
<td valign="top" align="left" width="390" bgcolor="#fff9e8"> </td>
<td valign="top" align="left" width="180" bgcolor="#fff9e8"> </td>
<td valign="top" align="left" width="10" bgcolor="#fff9e8"> </td>

</tr>
<tr>
<td valign="top" align="left" width="10" bgcolor="#fff9e8"><img height="12" alt="" width="10" border="0" src="^site_url/qa-plugin/email-formating/header3.gif"></td>
<td valign="top" align="left" width="390" bgcolor="#fff9e8">
<table cellspacing="0" cellpadding="10" width="100%" border="0">
<tbody>
<tr>
<td valign="top" align="left" bgcolor="#ffffff" style="font-size: 11px; font-family: Verdana,Arial,Helvetica,sans-serif">
<h2 style="font-size: 14px; color: rgb(65,64,66)">^title</h2>
<font style="font-family: Verdana"><span>
^body
</span></font></td>

</tr>
</tbody>
</table>
</td>
<td valign="top" align="left" width="180" bgcolor="#fff9e8">
<table cellspacing="0" cellpadding="8" width="100%" border="0">
<tbody>
<tr>
<td valign="top" align="left" bgcolor="#00a79d" style="font-size: 14px; color: rgb(255,255,255); font-family: Verdana,Arial,Helvetica,sans-serif"><i>Galapagos</i></td>

</tr>
<tr>
<td class="ECOinhoud" valign="top" align="left" bgcolor="#ffffff" style="border-right: rgb(59,97,174) 1px solid; font-size: 11px; border-left: rgb(59,97,174) 1px solid; line-height: 140%; border-bottom: rgb(59,97,174) 1px solid; font-family: Verdana,Arial,Helvetica,sans-serif"><a href="https://confluence.bmc.com/display/BSMSOL/Galapagos">Wiki</a></td>
</tr>
</tbody>
</table>
  </td>
<td valign="top" align="left" width="10" bgcolor="#fff9e8"><img height="12" alt="" width="10" border="0" src="^site_url/qa-plugin/email-formating/header3.gif"></td>

</tr>
<tr>
<td bgcolor="#000000" colspan="5" style="text-align: center"><img border="0" src="^logo_url"></td>
</tr>
<tr>
<td class="emailadres" colspan="5" style="font-size: 10px; font-family: Verdana,Arial,Helvetica,sans-serif; height: 26px; text-align: center"> </td>
</tr>
</tbody>
</table>

<br>
 </td>
</tr>
</tbody>
</table>
<br>
</body>
</html>
```
