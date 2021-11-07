# HarryPotterCharacters

App Overview
-

The app is comprised of 2 view controllers embedded inside a navigationViewController.  

The first is a UICollectionViewController which displays 7 buttons to the user:

All Characters
Students
Staff
Gryffindor
Hufflepuff
Ravenclaw
Slytherin

The second is a UITableViewController.  When the user taps a button from the main screen the app shows the user a list of characters from the catagory for which then have chosen


Personal Thoughts
-

I had never used Alamofire or cocoapods before, although I had heard of both and knew what they were.  But overall I found it fairly easy to work with as a technology.  But I image I have literally only scratched the surface of what its capable of.

The three fetch data functions in the HomeViewController could be refactored into a single function, passing it with arguments to get the desired data back from it.

The house sorting code could also be moved out of fetchAllCharacterData() and into its own function, although it may not be anymore efficent, it would give the code better structure and look alot better.



