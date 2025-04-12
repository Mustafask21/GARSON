import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../constants/colors.dart';
import '../services/auth_service.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'home_screen.dart';

class RegisterScreen extends StatefulWidget {
  final String userType; // 'garson' veya 'isletme'
  
  const RegisterScreen({
    Key? key, 
    required this.userType,
  }) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthService _authService = AuthService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  
  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  String? _errorMessage;
  int _currentStep = 0;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _nextStep() {
    if (_currentStep < 1) {
      setState(() {
        _currentStep += 1;
      });
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep -= 1;
      });
    }
  }

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;
    if (_passwordController.text != _confirmPasswordController.text) {
      setState(() {
        _errorMessage = 'Şifreler eşleşmiyor.';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      Map<String, dynamic> userData = {
        'name': _nameController.text.trim(),
        'phoneNumber': _phoneController.text.trim(),
        'userType': widget.userType,
      };

      await _authService.register(
        email: _emailController.text.trim(),
        password: _passwordController.text,
        role: widget.userType,
        userData: userData,
      );
      
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'email-already-in-use':
          message = 'Bu e-posta adresi zaten kullanılıyor.';
          break;
        case 'invalid-email':
          message = 'Geçersiz e-posta adresi.';
          break;
        case 'weak-password':
          message = 'Şifre çok zayıf.';
          break;
        case 'operation-not-allowed':
          message = 'Bu işlem şu anda kullanılamıyor.';
          break;
        default:
          message = 'Kayıt olurken bir hata oluştu: ${e.message}';
      }
      setState(() {
        _errorMessage = message;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Kayıt olurken beklenmeyen bir hata oluştu.';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Widget _buildPersonalInfoStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Kişisel Bilgiler',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        
        const SizedBox(height: 24),
        
        // İsim
        CustomTextField(
          controller: _nameController,
          hintText: 'Adınız Soyadınız',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Adınızı ve soyadınızı giriniz';
            }
            return null;
          },
        ),
        
        // E-posta
        CustomTextField(
          controller: _emailController,
          hintText: 'E-Posta adresiniz',
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'E-posta adresinizi giriniz';
            }
            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
              return 'Geçerli bir e-posta adresi giriniz';
            }
            return null;
          },
        ),
        
        // Telefon
        CustomTextField(
          controller: _phoneController,
          hintText: 'Telefon numaranız',
          keyboardType: TextInputType.phone,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Telefon numaranızı giriniz';
            }
            return null;
          },
        ),
        
        const SizedBox(height: 24),
        
        CustomButton(
          text: 'Devam',
          onPressed: _nextStep,
        ),
      ],
    );
  }

  Widget _buildPasswordStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Şifre Oluşturun',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        
        const SizedBox(height: 24),
        
        // Şifre
        CustomTextField(
          controller: _passwordController,
          hintText: 'Şifreniz',
          obscureText: _obscurePassword,
          suffixIcon: IconButton(
            icon: Icon(
              _obscurePassword ? Icons.visibility_off : Icons.visibility,
              color: Colors.white54,
            ),
            onPressed: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
            },
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Şifrenizi giriniz';
            }
            if (value.length < 6) {
              return 'Şifre en az 6 karakter olmalıdır';
            }
            return null;
          },
        ),
        
        // Şifre tekrar
        CustomTextField(
          controller: _confirmPasswordController,
          hintText: 'Şifrenizi tekrar giriniz',
          obscureText: _obscureConfirmPassword,
          suffixIcon: IconButton(
            icon: Icon(
              _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
              color: Colors.white54,
            ),
            onPressed: () {
              setState(() {
                _obscureConfirmPassword = !_obscureConfirmPassword;
              });
            },
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Şifrenizi tekrar giriniz';
            }
            if (value != _passwordController.text) {
              return 'Şifreler eşleşmiyor';
            }
            return null;
          },
        ),
        
        if (_errorMessage != null) ...[
          const SizedBox(height: 16),
          Text(
            _errorMessage!,
            style: const TextStyle(
              color: AppColors.error,
              fontSize: 14,
            ),
          ),
        ],
        
        const SizedBox(height: 24),
        
        Row(
          children: [
            Expanded(
              child: CustomButton(
                text: 'Geri',
                onPressed: _previousStep,
                isPrimary: false,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomButton(
                text: 'Kaydı Tamamla',
                onPressed: _register,
                isLoading: _isLoading,
              ),
            ),
          ],
        ),
      ],
    );
  }

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
        title: Text(
          widget.userType == 'garson' ? 'Garson Kaydı' : 'İşletme Kaydı',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: _currentStep == 0 ? _buildPersonalInfoStep() : _buildPasswordStep(),
            ),
          ),
        ),
      ),
    );
  }
} 