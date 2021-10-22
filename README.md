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
<img width="370" alt="Screen Shot 2021-10-22 at 10 04 49 AM" src="https://user-images.githubusercontent.com/30163040/138472298-a4860ed8-28f6-4a3e-b00d-3c0d57a4c73b.png"> <img width="365" alt="Screen Shot 2021-10-22 at 10 07 37 AM" src="https://user-images.githubusercontent.com/30163040/138472341-acf56a65-e84f-4276-b2b3-e602f5441fbf.png">
<p align="center"><img width="357" alt="Screen Shot 2021-10-22 at 10 08 13 AM" src="https://user-images.githubusercontent.com/30163040/138472365-9efe8748-a727-43b3-94ea-194963881d5d.png"></p>
