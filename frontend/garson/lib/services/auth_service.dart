import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Kimlik doğrulama durumunu izleme
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Kayıt olma fonksiyonu
  Future<UserCredential> register({
    required String email,
    required String password,
    required String role, // 'garson' veya 'isletme'
    required Map<String, dynamic> userData,
  }) async {
    try {
      // Firebase Auth ile kullanıcı oluşturma
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Kullanıcı bilgilerini Firestore'a kaydetme
      if (userCredential.user != null) {
        await _firestore.collection('users').doc(userCredential.user!.uid).set({
          'email': email,
          'role': role,
          'createdAt': FieldValue.serverTimestamp(),
          ...userData,
        });
      }

      return userCredential;
    } catch (e) {
      rethrow;
    }
  }

  // Giriş yapma fonksiyonu
  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      rethrow;
    }
  }

  // Çıkış yapma fonksiyonu
  Future<void> logout() async {
    await _auth.signOut();
  }

  // Mevcut kullanıcıyı alma
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Kullanıcı bilgilerini getirme
  Future<Map<String, dynamic>?> getUserData(String uid) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('users').doc(uid).get();
      return doc.exists ? doc.data() as Map<String, dynamic> : null;
    } catch (e) {
      return null;
    }
  }
} 