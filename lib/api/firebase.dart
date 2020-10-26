

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:tastn/extensions.dart';

class Firebase {

  void markRestaurantNo(String id) {
    FirebaseAuth auth = FirebaseAuth.instance;

    if (auth.currentUser != null) {
      FirebaseDatabase.instance.usersRef.child(auth.currentUser.uid).child('restaurants/$id').update({
        'test': 'test'
      });
    }
  }

  void markRestaurantYes(String id) {

  }

  void markRestaurantFavorite() {

  }

  void markRestaurantBack() {

  }

  void markRestaurantGarbage(String id) {
    FirebaseAuth auth = FirebaseAuth.instance;

    if (auth.currentUser != null) {
      FirebaseDatabase.instance.usersRef.child(auth.currentUser.uid).child('swipes/no').update({
        id: {
          'timestamp': DateTime.now()
        }
      });

      FirebaseDatabase.instance.usersRef.child(auth.currentUser.uid).child('swipes/hidden').update({
        id: true
      });
    }
  }
}