# API Call Tutorial

## Chase on Medium.com

This is from Chase's Medium articles about calling APIs from iOS apps. This project creates an iOS app that calls APIs from https://jsonplaceholder.typicode.com

## Article Link

Most of the code is based off Chase's article: https://medium.com/@jpmtech/make-and-parse-an-api-call-using-swiftui-32f970e2b067

<br>The searching was added based off Chase's article: https://medium.com/@jpmtech/how-to-add-search-to-your-swiftui-app-2d724bf72c16

### Personal Additions

* Code improvements: Chase's original article was written in February 2023. I updated the code based off iOS 17 improvements (e.g. @Observable instead of Observable protocol). I also built navigation for more details
* Navigation: I added navigation to the project that shows additional details in a separate view
* Tabbed view: I made the main view a tab view for easy switching between posts and users
* User data: I added a call to the users endpoint to parse more complicated JSON. You can use the User class as an example for parsing nested JSON (this data is 2-3 levels deep)
* Computed properties: I added computed properties for User that simplifies the address and company information
* Subviews: I moved a lot of code into reusable views to clean up the view code

## How to install

1. fork the project or download the .zip
2. open project in XCode v15 or later (earlier versions may or may not compile correctly)
3. run in simulator

## Find a bug?

If you find a bug or would like to submit an improvement to this project, please submit an issue using the issues tab above. If you would like to submit a PR with a fix, reference the issue you created.

## Known Issues (work in progress)

At this time, the code is running as expected.

## Like this project?

Check out Chase's other articles on Medium: https://medium.com/@jpmtech

## Support my work

If you're feeling generous, buy me a coffee or beer 😎 https://www.buymeacoffee.com/scottcrowder
