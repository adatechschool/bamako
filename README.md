Intructions for running the project:

- Download/open Xcode. 
- Pull the Github repository (git pull)
- Open the file with Xcode. 
- Press command and R to run the app. 
- Done. 

How it works:

- There's a mainApp function. 
- It calls the ContentView which in turn calls ImagesList. 
- ImagesList does two things:
  - Call the API. 
  - Display the data retrieved from the API according to a blueprint. 
- The blueprint for what a row should look like is contained in the ImagesRow file. 

From the get-go I decided to split the work into several parts:
- Creating the blueprint from what a single row should look like. 
- Making sure the row could be displayed as many times as possible. 
- Calling the API + retrieving the received data.
- Parsing the JSON data. 
- Displaying it. 

Attempt at bolstering performance, memory, battery and data:

To go further and improve the app's overall performance I decided to try pagination: the App only loads/sends asynchronous requests 
for what the user is currently seeing. 

If I'd have even more time I could have done one of two things:
  - Try to work on the APIs performance, plus de server(s) that hosts the API. 
  - Allow the app to cache some data so that if the user scrolls back up it doesn't have to send a new request for data it's already fetched. 
