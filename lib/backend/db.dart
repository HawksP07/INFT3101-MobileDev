// MongoDB Setup
// ignore_for_file: constant_identifier_names, prefer_typing_uninitialized_variables, camel_case_types

import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';

// username = "admin";
// password = "admin";

// connection string (mongo URL)
// "mongodb+srv://admin:admin@cluster0.lwt5o6f.mongodb.net/MobileFinal?retryWrites=true&w=majority&appName=Cluster0";

const MONGO_CONN_URL =
    "mongodb+srv://ramiyan2185:ravi1967@cluster0.lwt5o6f.mongodb.net/MobileFinal?retryWrites=true&w=majority&appName=Cluster0";

// collection name
const USER_COLLECTION = "Student";

class mongoDatabase {
  static var db;
  static var userCollection;

  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    userCollection = db.collection(USER_COLLECTION);
  }
}

// Function to handle user login
void login() {
  // Prompt user for username and password

  // Retrieve credentials from the database based on the provided username

  // Compare the provided password with the stored password

  // If credentials match:
  // Grant access to the user
  // Redirect to the main page of the app

  // Else:
  // Deny access
  // Show an error message (e.g., "Invalid username or password")
}
