import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_project_baws/src/domain/user.dart';

class UserRepository {
  final FirebaseFirestore instance;

  UserRepository(this.instance);

  User? user;

  // Bei SignUp (User noch nicht in Firestore!)
  Future<void> createUserInFirestore(User user) async {
    try {
      print("Erstelle User");
      instance.collection("users").doc(user.id).set(user.toMap());
    } catch (e) {
      print(e);
    }
    this.user = user;
  }

  // Bei SignIn (Weil User ist bei Firebase Authentication schon drin!!)
  Future<User?> getUserFromFirestore(String uid) async {
    try {
      // Holen unser custom User von Firestore
      final doc = await instance.collection("users").doc(uid).get();
      User? user;

      // Wenn das Document in Firestore existiert
      if (doc.exists) {
        // Parse Data to Map
        final map = doc.data()!;

        // Create User Instance from map
        user = User.fromMap(map);
        this.user = user;
        return user;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
