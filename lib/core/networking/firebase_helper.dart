import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseHelper {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Login user with email and password
  Future<void> loginUser(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Additional logic on successful login
    } catch (e) {
      throw Exception("Login failed: $e");
    }
  }

  // Register user with email and password
  Future registerUser(String email, String password) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  // Log out the current user
  Future logOut() async {
    await auth.signOut();
  }

  // Get the currently signed-in user
  User? getCurrentUser() {
    return auth.currentUser;
  }

  Future<void> addTransactionToFirestore(
      {required String userId,
      required String name,
      required double price,
      required DateTime date}) async {
    try {
      await firestore
          .collection('transactions')
          .doc(userId)
          .collection('transactions')
          .add({'name': name, 'price': price, 'date': date});
    } catch (e) {
      print("Error: " + e.toString());
      throw Exception("Failed to add transaction: $e");
    }
  }
}
