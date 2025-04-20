import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../../core/constants/app_colors.dart';

class CompanyRegisterScreen extends StatefulWidget {
  const CompanyRegisterScreen({Key? key}) : super(key: key);

  @override
  State<CompanyRegisterScreen> createState() => _CompanyRegisterScreenState();
}

class _CompanyRegisterScreenState extends State<CompanyRegisterScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _obscurePassword = true;
  
  String _selectedCity = '';
  String _selectedDistrict = '';

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _handleRegister() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      // Kayıt işlemleri burada yapılacak
      // Başarılı kayıt sonrası giriş sayfasına yönlendir
      context.go('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.gradientStart,
              AppColors.gradientEnd,
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: FormBuilder(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // E-Posta alanı
                  FormBuilderTextField(
                    name: 'email',
                    decoration: const InputDecoration(
                      hintText: 'E-Posta adresinizi girin',
                      prefixIcon: Icon(Icons.email, color: AppColors.textGray),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(errorText: 'E-posta adresi gerekli'),
                      FormBuilderValidators.email(errorText: 'Geçerli bir e-posta adresi girin'),
                    ]),
                  ),
                  const SizedBox(height: 16),
                  
                  // Şifre alanı
                  FormBuilderTextField(
                    name: 'password',
                    decoration: InputDecoration(
                      hintText: 'Şifrenizi girin',
                      prefixIcon: const Icon(Icons.lock, color: AppColors.textGray),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword ? Icons.visibility_off : Icons.visibility,
                          color: AppColors.textGray,
                        ),
                        onPressed: _togglePasswordVisibility,
                      ),
                    ),
                    obscureText: _obscurePassword,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(errorText: 'Şifre gerekli'),
                      FormBuilderValidators.minLength(6, errorText: 'Şifre en az 6 karakter olmalı'),
                    ]),
                  ),
                  const SizedBox(height: 16),
                  
                  // Şifre kontrol alanı
                  FormBuilderTextField(
                    name: 'password_confirmation',
                    decoration: const InputDecoration(
                      hintText: 'Şifrenizi kontrol edin',
                      prefixIcon: Icon(Icons.lock_outline, color: AppColors.textGray),
                    ),
                    obscureText: true,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(errorText: 'Şifre tekrarı gerekli'),
                      (val) {
                        if (val != _formKey.currentState?.fields['password']?.value) {
                          return 'Şifreler eşleşmiyor';
                        }
                        return null;
                      },
                    ]),
                  ),
                  const SizedBox(height: 16),
                  
                  // Telefon alanı
                  FormBuilderTextField(
                    name: 'phone',
                    decoration: InputDecoration(
                      hintText: 'Telefon Numarası',
                      prefixIcon: const Icon(Icons.phone, color: AppColors.textGray),
                      prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
                      prefix: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          '+90',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(errorText: 'Telefon numarası gerekli'),
                      FormBuilderValidators.numeric(errorText: 'Geçerli bir telefon numarası girin'),
                      FormBuilderValidators.minLength(10, errorText: 'Geçerli bir telefon numarası girin'),
                    ]),
                  ),
                  const SizedBox(height: 16),
                  
                  // Firma Adı/Unvanı
                  FormBuilderTextField(
                    name: 'companyName',
                    decoration: const InputDecoration(
                      hintText: 'Firma Adı/Unvanı',
                    ),
                    validator: FormBuilderValidators.required(errorText: 'Firma adı gerekli'),
                  ),
                  const SizedBox(height: 16),
                  
                  // Vergi No ve Sicil No
                  Row(
                    children: [
                      Expanded(
                        child: FormBuilderTextField(
                          name: 'taxNumber',
                          decoration: const InputDecoration(
                            hintText: 'Vergi No',
                          ),
                          keyboardType: TextInputType.number,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(errorText: 'Vergi no gerekli'),
                            FormBuilderValidators.numeric(errorText: 'Sayısal bir değer girin'),
                          ]),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: FormBuilderTextField(
                          name: 'registrationNumber',
                          decoration: const InputDecoration(
                            hintText: 'Sicil Numarası',
                          ),
                          keyboardType: TextInputType.number,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(errorText: 'Sicil no gerekli'),
                            FormBuilderValidators.numeric(errorText: 'Sayısal bir değer girin'),
                          ]),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  // Firma Adresi
                  const Text(
                    'Firma Adresi',
                    style: TextStyle(
                      color: AppColors.textGray,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  
                  // Şehir ve İlçe seçimi
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: DropdownButton<String>(
                            value: _selectedCity.isEmpty ? null : _selectedCity,
                            hint: const Text('Şehir', style: TextStyle(color: Colors.white)),
                            dropdownColor: AppColors.darkBackground,
                            style: const TextStyle(color: Colors.white),
                            underline: const SizedBox(),
                            icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                            isExpanded: true,
                            items: ['İstanbul', 'Ankara', 'İzmir', 'Bursa', 'Antalya']
                                .map((city) => DropdownMenuItem<String>(
                                      value: city,
                                      child: Text(city),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              if (value != null) {
                                setState(() {
                                  _selectedCity = value;
                                  _selectedDistrict = '';
                                });
                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: DropdownButton<String>(
                            value: _selectedDistrict.isEmpty ? null : _selectedDistrict,
                            hint: const Text('İlçe', style: TextStyle(color: Colors.white)),
                            dropdownColor: AppColors.darkBackground,
                            style: const TextStyle(color: Colors.white),
                            underline: const SizedBox(),
                            icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                            isExpanded: true,
                            items: _selectedCity.isEmpty
                                ? []
                                : ['Merkez', 'Kuzey', 'Güney', 'Doğu', 'Batı']
                                    .map((district) => DropdownMenuItem<String>(
                                          value: district,
                                          child: Text(district),
                                        ))
                                    .toList(),
                            onChanged: _selectedCity.isEmpty
                                ? null
                                : (value) {
                                    if (value != null) {
                                      setState(() {
                                        _selectedDistrict = value;
                                      });
                                    }
                                  },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  // Açık Adres
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: FormBuilderTextField(
                      name: 'addressDetails',
                      decoration: const InputDecoration(
                        hintText: 'Açık adres...',
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(color: Colors.black87),
                      maxLines: 3,
                    ),
                  ),
                  const SizedBox(height: 40),
                  
                  // Devam butonu
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _handleRegister,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black87,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Devam',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.arrow_forward,
                              color: Colors.black87,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
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