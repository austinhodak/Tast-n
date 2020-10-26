import 'package:firebase_database/firebase_database.dart';

extension FirebaseExtension on FirebaseDatabase {
  DatabaseReference get usersRef {
    return FirebaseDatabase.instance.reference().child("users");
  }
}

extension Testing on String {
  bool get isValidName {
    return true;
  }

  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}