FROM wiesom/question2answer

# Webmaster plugin
#RUN q2a-install-plugin \
#	Towhidn/Q2A-Webmaster

#RUN mv /var/www/html/qa-plugin/q2a-webmaster/q2a-webmaster /var/www/html/qa-plugin/q2a-webmaster_tmp
#RUN rm -fr /var/www/html/qa-plugin/q2a-webmaster
#RUN mv /var/www/html/qa-plugin/q2a-webmaster_tmp /var/www/html/qa-plugin/q2a-webmaster

# Open login plugin
RUN q2a-install-plugin \
	alixandru/q2a-open-login

RUN rm -fr /var/www/html/qa-plugin/facebook-login
RUN mv /var/www/html/qa-plugin/q2a-open-login/providers-sample.php /var/www/html/qa-plugin/q2a-open-login/providers.php
RUN chmod a+w /var/www/html/qa-plugin/q2a-open-login/providers.php

# Tag descriptions
#RUN q2a-install-plugin \
#	Towhidn/q2a-tag-descriptions

#RUN mv /var/www/html/qa-plugin/q2a-tag-descriptions/q2a-tag-description /var/www/html/qa-plugin/.
#RUN rm -fr /var/www/html/qa-plugin/q2a-tag-descriptions

# Slack
RUN q2a-install-plugin \
	LeonardChallis/q2a-slack

RUN mv /var/www/html/qa-plugin/q2a-slack/q2a-slack /var/www/html/qa-plugin/q2a-slack_tmp
RUN rm -fr /var/www/html/qa-plugin/q2a-slack
RUN mv /var/www/html/qa-plugin/q2a-slack_tmp /var/www/html/qa-plugin/q2a-slack

# More plugins
RUN q2a-install-plugin \
	amiyasahu/q2a-express-editor \
	svivian/q2a-markdown-editor \
	q2apro/q2apro-prevent-simultaneous-edits \
	NoahY/q2a-smilies \
	nakov/q2a-plugin-open-questions \
	NoahY/q2a-xml-rpc \
	svivian/q2a-edit-history \
	amiyasahu/q2a-breadcrumbs \
	q2apro/q2apro-most-active-users \
	q2apro/q2apro-recent-events-widget \
	svivian/q2a-tag-list-widget \
	q2apro/q2apro-ajax-usersearch \	
	q2apro/q2apro-warn-on-leave \
	NoahY/q2a-role-markers \
	amiyasahu/q2a-sort-answers \
	ruuttt/q2a-email-formating \
	NoahY/q2a-cat \
	q2apro/q2apro-comment-to-answer \
	KrzysztofKielce/q2a-backup \
	amiyasahu/q2a-delete-hidden-posts \
	q2apro/q2apro-list-uploads-page \
	NoahY/q2a-post-merge \
	svivian/q2a-tagging-tools

# TBD
# 	Towhidn/Q2A-Tab-Widget \
#	NoahY/q2a-theme-switcher \
#	NoahY/q2a-print \
#	vijsha79/q2a-elasticsearch \
#	NoahY/q2a-embed \
#	NoahY/q2a-privileges \
#	svivian/q2a-user-activity-plus \
#	NoahY/q2a-signatures \	
#	NoahY/q2a-history \


# NOT WORKING
# kfuchs/permission2categories
# NoahY/q2a-accept-rate
# NoahY/q2a-bookmarks
# heartsmile/search-in-setting-plugin
# zakkak/q2a-email-notifications-revised
# amiyasahu/q2a-email-notification

## Install Plugins
RUN q2a-install-plugin \
	NoahY/q2a-poll \
	NoahY/q2a-comment-voting \
	NoahY/q2a-badges \
	amiyasahu/q2a-syntax-highlighter

## Replace editor with a new one
RUN rm -rf /var/www/html/qa-plugin/wysiwyg-editor/ckeditor
ADD ckeditor*.zip /var/www/html/qa-plugin/wysiwyg-editor/ckeditor.zip
RUN cd /var/www/html/qa-plugin/wysiwyg-editor/ && unzip ckeditor.zip && rm -rf ckeditor.zip
