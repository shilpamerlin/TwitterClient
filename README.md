# iOS - Challenge: TwitterClient
#### An app which demonstrates the basic Twitter functionlity such as posting tweets, without using real Twitter API.
* Swift: 5
* Architecture: MVVM
* Dependencies: Core Data framework
* Unit Testing: Wrote test cases to check the login functionality, saving and retreving data from Core Data 
## Getting started
* Open the TwitterClient in Xcode.
* Run the app
#### Login Screen
* A single user can Sign in to the application
* Username and password hard coded in the project, username <b>shilpa@mail.com</b> password `1234`
#### Feed Screen
* Collection view to display the tweets along with timestamp from newest to oldest.
* User can create new tweet by clicking on the Tweet button on bottom of the screen.
* User can logout from the app by clicking Logout button.
#### UploadTweet Screen
* User can query for newer tweets which will append to the collection view.
* Display all the tweets if same user user logged in to the app again by using data persistance framework - Core Data
## PreRequisties
* XCode: 13.0
## Screenshots
