# flutter FOSS workshop
 
This is the repository containing the note-taking app developed throughout the two workshops I hosted as part of the FOSS Advanced Track. The app consists of a simple, material-style UI that allows users to create notes and display them dynamically. 

The primary app file is inside of the 'lib' folder, and consists of very descriptive comments embedded throughout, so that way anyone can understand at first glance. There are so many comments it almost impedes the actual code (when does that ever happen in production lol), but this serves as a great launching point for anyone getting started.

# Sample Screens
<div align="center">
  <img src="https://github.com/user-attachments/assets/1808e6bf-e933-4c8d-bf74-d5d18da6999f" width="400"/>
  <h3>Fig. 1: This is the home screen, fitted with some notes for pedagogical purposes.</h3>
  <h1></h1>
  <img src="https://github.com/user-attachments/assets/57fa10d1-8657-4eea-b425-3aac543a580c" width="400"/>
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
  - Or just make it your own! Experiment with the plethora of built-in widgets the flutter provides natively.
 
Hope you enjoy learning with the app as much I did making it!    
