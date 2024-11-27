// MongoDB Setup
// ignore_for_file: constant_identifier_names, prefer_typing_uninitialized_variables, camel_case_types, avoid_print
// ignore_for_file: unused_import

import 'dart:developer';
import 'dart:io';
import 'package:mongo_dart/mongo_dart.dart';

// username = "admin";
// password = "admin";

// connection string (mongo URL)
// "mongodb+srv://admin:admin@cluster0.lwt5o6f.mongodb.net/MobileFinal?retryWrites=true&w=majority&appName=Cluster0";
// mongodb://project:UNwGyqH4uNXx5iT4@cluster0-shard-00-00.lwt5o6f.mongodb.net:27017,cluster0-shard-00-01.lwt5o6f.mongodb.net:27017,cluster0-shard-00-02.lwt5o6f.mongodb.net:27017/my_database?authSource=admin&replicaSet=atlas-2wd41d-shard-0&ssl=true
// mongodb+sv://project:UNwGyqH4uNXx5iT4@cluster0.lwt5o6f.mongodb.net/MobileFinal?retryWrites=true&w=majority&appName=Cluster0

const MONGO_CONN_URL =
    "mongodb://project:UNwGyqH4uNXx5iT4@cluster0-shard-00-00.lwt5o6f.mongodb.net:27017,cluster0-shard-00-01.lwt5o6f.mongodb.net:27017,cluster0-shard-00-02.lwt5o6f.mongodb.net:27017/my_database?authSource=admin&replicaSet=atlas-2wd41d-shard-0&ssl=true";

// collection name
const USER_COLLECTION = "Student";

class mongoDatabase {
  static var db;
  static var userCollection;

  static connect() async {
    try {
      final db = Db(MONGO_CONN_URL);
      await db.open(secure: true); // Automatically handles SSL
      print('Connected to MongoDB');
      await db.close();
    } 
    catch (e) {print('Error connecting to MongoDB: $e');}
  }
}