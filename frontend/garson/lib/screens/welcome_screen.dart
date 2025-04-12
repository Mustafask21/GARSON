import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/custom_button.dart';
import 'login_screen.dart';
import 'register_type_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/logo.png', 
                    width: 60,
                    height: 60,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.restaurant,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Uygulama adı
              const Text(
                'Garson',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              const SizedBox(height: 100),
              
              // Giriş butonu
              CustomButton(
                text: 'Giriş Yap',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
                isPrimary: true,
              ),
              
              const SizedBox(height: 16),
              
              // Kayıt butonu
              CustomButton(
                text: 'Kayıt Ol',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterTypeScreen()),
                  );
                },
                isPrimary: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
} 