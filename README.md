# URIBlockNE
A network extension app to block a user input URI. Meant as a network extension filter proof of concept.

This is a proof of concept. It pull in a number of different projects, most notably Sift-ios (https://github.com/agrinman/sift-ios) and AwesomeCache (https://github.com/aschuch/AwesomeCache). Therefore I'm not licensing out my work but please be careful to adhere to their licenses if used for anything other than research. Sift-ios does much more so I'm using maybe a percent of the wonderful code in there. Check it out as it's pretty rad.

## What URIBlockNE does
This app simply presents a user with a text input and based on the text provided blocks access to the site using a network extension. That text input could easily be replaced with a large text blob of URIs, an engine that produces expressions, etc. Compiling will require the entitlement and the developer team in the Xcode project will need to be set to your own. Here's what that looks like:

![alt text](https://github.com/krypted/URIBlockNE/blob/main/demovid.gif?raw=true)

