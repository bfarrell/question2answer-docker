FROM wiesom/question2answer

# Webmaster plugin
RUN q2a-install-plugin \
	Towhidn/Q2A-Webmaster

RUN mv /var/www/html/qa-plugin/q2a-webmaster/q2a-webmaster /var/www/html/qa-plugin/q2a-webmaster_tmp
RUN rm -fr /var/www/html/qa-plugin/q2a-webmaster
RUN mv /var/www/html/qa-plugin/q2a-webmaster_tmp /var/www/html/qa-plugin/q2a-webmaster

# Open login plugin
RUN q2a-install-plugin \
	alixandru/q2a-open-login

RUN rm -fr /var/www/html/qa-plugin/facebook-login
RUN mv /var/www/html/qa-plugin/q2a-open-login/providers-sample.php /var/www/html/qa-plugin/q2a-open-login/providers.php
RUN chmod a+w /var/www/html/qa-plugin/q2a-open-login/providers.php

# Tag descriptions
RUN q2a-install-plugin \
	Towhidn/q2a-tag-descriptions

RUN mv /var/www/html/qa-plugin/q2a-tag-descriptions/q2a-tag-description /var/www/html/qa-plugin/.
RUN rm -fr /var/www/html/qa-plugin/q2a-tag-descriptions

# More plugins
RUN q2a-install-plugin \
	NoahY/q2a-embed \
	amiyasahu/q2a-express-editor \
	svivian/q2a-markdown-editor \
	q2apro/q2apro-prevent-simultaneous-edits \
	NoahY/q2a-smilies \
	vijsha79/q2a-elasticsearch \
	nakov/q2a-plugin-open-questions \
	NoahY/q2a-xml-rpc \
	svivian/q2a-edit-history \
	NoahY/q2a-print \
	svivian/q2a-user-activity-plus \
	NoahY/q2a-history \
	amiyasahu/q2a-breadcrumbs \
	q2apro/q2apro-most-active-users \
	q2apro/q2apro-recent-events-widget \
	Towhidn/Q2A-Tab-Widget \
	svivian/q2a-tag-list-widget \
	NoahY/q2a-accept-rate \
	q2apro/q2apro-ajax-usersearch \
	NoahY/q2a-bookmarks \
	q2apro/q2apro-warn-on-leave \
	NoahY/q2a-privileges \
	NoahY/q2a-role-markers \
	amiyasahu/q2a-sort-answers \
	NoahY/q2a-theme-switcher \
	NoahY/q2a-signatures \
	amiyasahu/q2a-email-notification \
	ruuttt/q2a-email-formating \
	zakkak/q2a-email-notifications-revised \
	NoahY/q2a-cat \
	q2apro/q2apro-comment-to-answer \
	KrzysztofKielce/q2a-backup \
	amiyasahu/q2a-delete-hidden-posts \
	q2apro/q2apro-list-uploads-page \
	NoahY/q2a-post-merge \
	heartsmile/search-in-setting-plugin \
	svivian/q2a-tagging-tools

# NOT WORKING
# kfuchs/permission2categories

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
