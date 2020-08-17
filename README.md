# psst

> psst...c'mere. lemme tell you a secret...

Ever needed to create an encrypted string in your Rails app, and decrypt it in your Lucky app? Yeah, me too. There's lots of solutions for encrypting strings, but they all focus on being within the same app.

Thankfully, both Ruby and Crystal support OpenSSL, but it's a bit confusing to use and figure out. All this library does is use the native OpenSSL with minimal setup so you don't have to go digging around docs in several different places.

## Installation

### Crystal

### Ruby