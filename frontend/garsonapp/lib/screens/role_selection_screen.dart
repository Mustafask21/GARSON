import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../components/custom_button.dart';
import 'garson_register_screen.dart';
import 'company_register_screen.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Rol Seçimi', style: AppTextStyles.subheading),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Başlık
              const Spacer(flex: 2),
              const Center(
                child: Text(
                  'Size uygun olan seçeneği\nseçip devam edebilirsiniz',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.heading,
                ),
              ),
              const Spacer(flex: 3),
              
              // Garson butonu
              CustomButton(
                text: 'GARSON',
                onPressed: () {
                  // Garson rolü seçildi, garson kayıt ekranına yönlendir
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const GarsonRegisterScreen(),
                    ),
                  );
                },
                icon: Icons.person,
              ),
              const SizedBox(height: 20),
              
              // Şirket butonu
              CustomButton(
                text: 'ŞİRKET',
                onPressed: () {
                  // Şirket rolü seçildi, firma kayıt ekranına yönlendir
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CompanyRegisterScreen(),
                    ),
                  );
                },
                isPrimary: false,
                icon: Icons.business,
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
} 