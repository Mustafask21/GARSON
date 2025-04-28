import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  User? get currentUser => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

//register
Future<void> createUser({required String email, required String password}) async {
await _auth.createUserWithEmailAndPassword(email: email, password: password);
}

//login
Future<void> login(String email, String password) async {
await _auth.signInWithEmailAndPassword(email: email, password: password);
}

//logout
Future<void> logout() async {
await _auth.signOut();
}




}
