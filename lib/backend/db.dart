import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';

const MONGO_CONN_URL =
    "mongodb://project:UNwGyqH4uNXx5iT4@cluster0-shard-00-00.lwt5o6f.mongodb.net:27017,cluster0-shard-00-01.lwt5o6f.mongodb.net:27017,cluster0-shard-00-02.lwt5o6f.mongodb.net:27017/my_database?authSource=admin&replicaSet=atlas-2wd41d-shard-0&ssl=true";

const USER_COLLECTION = "Student";

class MongoDatabase {
  static Db? db;
  static DbCollection? userCollection;

  static Future<void> connect() async {
    try {
      db = Db(MONGO_CONN_URL);
      await db!.open(secure: true);
      userCollection = db!.collection(USER_COLLECTION);
      print('Connected to MongoDB');
    } catch (e) {
      print('Error connecting to MongoDB: $e');
    }
  }

  static Future<void> close() async {
    await db?.close();
    print('Disconnected from MongoDB');
  }
}

class Authentication {
  static Future<bool> login(String username, String password) async {
    const validUsername = 'admin';
    const validPassword = 'admin';

    // Ensure the database is connected
    await MongoDatabase.connect();

    if (username == validUsername && password == validPassword) {
      print('Login successful');
      return true;
    } else {
      print('Invalid credentials');
      return false;
    }
  }
}
