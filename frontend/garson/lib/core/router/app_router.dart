import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../ui/screens/splash/splash_screen.dart';
import '../../ui/screens/auth/login_screen.dart';
import '../../ui/screens/auth/register_type_screen.dart';
import '../../ui/screens/auth/user_register_screen.dart';
import '../../ui/screens/auth/company_register_screen.dart';
import '../../ui/screens/home/home_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      // Splash Screen
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      
      // Login Screen
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      
      // Register Type Selection Screen (Garson veya Şirket seçimi)
      GoRoute(
        path: '/register-type',
        builder: (context, state) => const RegisterTypeScreen(),
      ),
      
      // User Registration Screen
      GoRoute(
        path: '/register-user',
        builder: (context, state) => const UserRegisterScreen(),
      ),
      
      // Company Registration Screen
      GoRoute(
        path: '/register-company',
        builder: (context, state) => const CompanyRegisterScreen(),
      ),
      
      // Home Screen
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Sayfa bulunamadı: ${state.uri.path}'),
      ),
    ),
  );
} 