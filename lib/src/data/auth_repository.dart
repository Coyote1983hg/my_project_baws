/* 
  X Zugriff auf User (UID, Email, DisplayName, PhotoURL)
  X Registierung
  X Login
  X Logout
  X AuthStateChanges
  
   */

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthRepository {
  // Attribute
  final FirebaseAuth _firebaseAuth;

  // Konstruktor
  AuthRepository(this._firebaseAuth);

  // Methoden

  /// returns the currently logged in [User]
  /// or `null` if no User is logged in
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  Future<void> signUpWithEmailAndPassword(String email, String pw) {
    return _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: pw);
  }

  Future<void> loginWithEmailAndPassword(String email, String pw) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: pw);
      debugPrint("Logged in");
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
    } catch (e) {
      debugPrint("$e");
    }
  }

  Future<void> logout() {
    return _firebaseAuth.signOut();
  }

  Stream<User?> authStateChanges() {
    return _firebaseAuth.authStateChanges();
  }
}
