# URIBlockNE
A network extension app to block a user input URI. Meant as a network extension filter proof of concept. This is just a research effort to display one of the many capabilities of the NetworkExtension APIs from Apple.

Again, this is just a proof of concept. It pull in a number of different projects, most notably Sift-ios (https://github.com/agrinman/sift-ios) and AwesomeCache (https://github.com/aschuch/AwesomeCache). Therefore I'm not licensing out my work but please be careful to adhere to their licenses if used for anything other than research. Sift-ios doesn't really block but does much more so I'm using maybe a percent of the wonderful code in there. Check it out as it's pretty rad. It's meant for monitoring opened sockets and in this project we're just monitoring to see if the attempt matches a pattern. To rewrite the important bits for just the blocking could probably be done much more succinctly but by starting with sift-ios we're able to expand the capabilities to block based on much more complex patterns for more than just a URI fairly easily later.

## What URIBlockNE does
This app simply presents a user with a text input and based on the text provided blocks access to the site using a network extension. That text input could easily be replaced with a large text blob of URIs, an engine that produces expressions, etc. Compiling will require the entitlement and the developer team in the Xcode project will need to be set to your own. Here's what that looks like:

![alt text](https://github.com/krypted/URIBlockNE/blob/main/demovid.gif?raw=true)

