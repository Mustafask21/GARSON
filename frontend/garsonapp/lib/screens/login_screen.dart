import 'package:flutter/material.dart';
import '../components/logo.dart';
import '../components/custom_button.dart';
import '../components/custom_text_field.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import 'role_selection_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Giriş işlemleri burada yapılacak
      
      // pushReplacement yerine push kullanarak önceki ekranı koruyoruz
      // böylece geri dön butonu çalışacak
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const RoleSelectionScreen(),
        ),
      );
    }
  }

  void _register() {
    // Kayıt sayfasına yönlendirme
    // Şimdilik aynı rol seçim sayfasına gider
    
    // pushReplacement yerine push kullanarak önceki ekranı koruyoruz
    // böylece geri dön butonu çalışacak
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const RoleSelectionScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  const GarsonLogo(size: 50),
                  const SizedBox(height: 15),
                  const GradientBar(),
                  const SizedBox(height: 50),
                  
                  // E-Posta girişi
                  CustomTextField(
                    hintText: 'E-Posta adresinizi girin',
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen e-posta adresinizi girin';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  
                  // Şifre girişi
                  CustomTextField(
                    hintText: 'Şifrenizi girin',
                    obscureText: true,
                    isPassword: true,
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen şifrenizi girin';
                      }
                      return null;
                    },
                  ),
                  
                  // Şifremi unuttum
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Şifremi unuttum işlemi
                        },
                        child: Text(
                          'Şifremi unuttum',
                          style: AppTextStyles.bodyText.copyWith(
                            color: AppColors.secondaryColor,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 30),
                  // Giriş butonu
                  CustomButton(
                    text: 'Giriş Yap',
                    onPressed: _login,
                  ),
                  const SizedBox(height: 15),
                  // Kayıt butonu
                  CustomButton(
                    text: 'Kayıt Ol',
                    onPressed: _register,
                    isPrimary: false,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
} 