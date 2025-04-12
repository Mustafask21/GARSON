import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/custom_button.dart';
import 'register_screen.dart';

class RegisterTypeScreen extends StatelessWidget {
  const RegisterTypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Size uygun olan seçeneği\nseçip devam edebilirsiniz',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              
              const SizedBox(height: 64),
              
              // Garson butonu
              CustomButton(
                text: 'GARSON',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterScreen(userType: 'garson'),
                    ),
                  );
                },
                isPrimary: true,
              ),
              
              const SizedBox(height: 16),
              
              // İşletme butonu
              CustomButton(
                text: 'ŞİRKET',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterScreen(userType: 'isletme'),
                    ),
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