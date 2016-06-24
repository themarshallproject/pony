# Pony

Pony is a web app for building HTML emails from user-defined templates. It takes care of converting from Markdown and inlining CSS.

[![CircleCI](https://circleci.com/gh/themarshallproject/pony.svg?style=svg)](https://circleci.com/gh/themarshallproject/pony)

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/ivarvong/pony/tree/master)

[Live Demo](https://pony-demo.herokuapp.com/new-session/demo)

# Overview

We created Pony so that our staff could produce beautifully-designed emails export them to MailChimp without having to touch code. By splitting off the HTML as a header and footer as a reusable template wrapped around a [Markdown](https://daringfireball.net/projects/markdown/basics) body, Pony is designed to strike a balance between customization and usability.

# Templates

MailChimp has written [a set of basic guidelines](http://templates.mailchimp.com/getting-started/html-email-basics/) for creating HTML email templates.

We’ve included a sample starter template to get you started.

# Process

- Create an HTML email template (split as two discrete chunks, a header which might include an opening `<table>` tag and a footer which might close the `</table>`) and save it in Pony.

- Then you can create a new email, select the template you’ve created and paste in the body of the email. Click save, and your live preview will appear. You can then style the email which will adopt the style of any Markdownable elements (such has `<h1>` and `<p>`) you have declared in the `<style>` tag of the template.

- Once you’re ready to go, copy the export URL to the appropriate field ([Code Your Own Template > Import from URL](http://kb.mailchimp.com/campaigns/ways-to-build/import-html-from-url-to-create-a-campaign)) inside MailChimp. The export URL is publicly visible (although protected by a random hash in the URL) so MailChimp can pull it in.
