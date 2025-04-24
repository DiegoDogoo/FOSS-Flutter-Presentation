# flutter FOSS workshop
 
This is the repository containing the note-taking app developed throughout the two workshops I hosted as part of the FOSS Advanced Track. The app consists of a simple, material-style UI that allows users to create notes and display them dynamically. 

The source code is uploaded as just the dart file, as the entire flutter project is simply too big, and anyone can quickly create their own project locally, or use even use DartPad (https://dartpad.dev/)!

The main.dart file consists of very descriptive comments embedded throughout, so that way anyone can understand at first glance. There are so many comments it almost impedes the actual code (when does that ever happen in production lol), but this serves as a great launching point for anyone getting started. There is also the version without any comments, if wanted.

# Sample Screens
<div align="center">

  <img src="https://github.com/user-attachments/assets/cdc7e0d1-a2ba-442e-899b-693372a5634a" width="400"/>
  <h3>Fig. 1: This is the home screen, fitted with some notes for pedagogical purposes.</h3>
  <h1></h1>
  <img src="https://github.com/user-attachments/assets/733b1a59-0bd8-44a7-b0df-e64dec086967" width="400"/>
  <h3>Fig. 2: The TextFormField also has validation, enhancing user experience</h3>
  <h1></h1>
</div>

# Expansion Ideas

- Use an animatedList() in place of ListView to make the app feel MUCH better!
- Add a storage solution to maintain notes between app sessions.
  - Local Storage: SQLite - https://pub.dev/packages/sqflite
  - Cloud Storage: Firebase Firestore - https://pub.dev/packages/cloud_firestore and https://pub.dev/packages/firebase_core
- Make the notes removable by sliding them! 
  - Flutter Slidable - https://pub.dev/packages/flutter_slidable
- Or just make the app your own! Experiment with the plethora of built-in widgets the flutter provides natively.
 
Hope you enjoy learning with the app as much I did making it!    
