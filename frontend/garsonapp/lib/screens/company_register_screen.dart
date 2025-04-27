import 'package:flutter/material.dart';
import '../components/custom_button.dart';
import '../components/custom_text_field.dart';
import '../components/phone_text_field.dart';
import '../components/location_selector.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class CompanyRegisterScreen extends StatefulWidget {
  const CompanyRegisterScreen({Key? key}) : super(key: key);

  @override
  State<CompanyRegisterScreen> createState() => _CompanyRegisterScreenState();
}

class _CompanyRegisterScreenState extends State<CompanyRegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  
  // Text controller'ları
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _companyNameController = TextEditingController();
  final _taxNumberController = TextEditingController();
  final _addressController = TextEditingController();
  
  // Şehir ve ilçe seçimleri
  String _selectedCity = '';
  String _selectedDistrict = '';
  
  // Örnek şehir listesi
  final List<String> _cities = [
    'İstanbul', 'Ankara', 'İzmir', 'Bursa', 
    'Antalya', 'Adana', 'Konya', 'Trabzon'
  ];
  
  // Örnek ilçe listesi
  final List<String> _districts = [
    'Kadıköy', 'Beşiktaş', 'Şişli', 'Ümraniye', 
    'Maltepe', 'Bakırköy', 'Ataşehir', 'Beyoğlu'
  ];

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    _companyNameController.dispose();
    _taxNumberController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  // Kayıt formu gönderimi
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form doğrulama başarılı ise kayıt işlemi gerçekleştirilir
      // Burada API çağrısı yapılabilir
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Firma kayıt işlemi başarılı!')),
      );
      
      // Başarılı kayıt sonrası yönlendirme eklenebilir
    }
  }

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
        title: const Text('Firma Kaydı', style: AppTextStyles.subheading),
      ),
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // E-Posta alanı
                  CustomTextField(
                    hintText: 'E-Posta adresinizi girin',
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'E-posta alanı boş bırakılamaz';
                      }
                      if (!value.contains('@')) {
                        return 'Geçerli bir e-posta adresi girin';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  
                  // Şifre alanı
                  CustomTextField(
                    hintText: 'Şifrenizi girin',
                    controller: _passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Şifre alanı boş bırakılamaz';
                      }
                      if (value.length < 6) {
                        return 'Şifre en az 6 karakter olmalıdır';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  
                  // Şifre tekrar alanı
                  CustomTextField(
                    hintText: 'Şifrenizi kontrol edin',
                    controller: _confirmPasswordController,
                    obscureText: true,
                    validator: (value) {
                      if (value != _passwordController.text) {
                        return 'Şifreler eşleşmiyor';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  
                  // Telefon numarası alanı
                  PhoneTextField(
                    controller: _phoneController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Telefon numarası boş bırakılamaz';
                      }
                      if (value.length < 10) {
                        return 'Geçerli bir telefon numarası girin';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  
                  // Firma bilgileri
                  CustomTextField(
                    hintText: 'Firma Adı/Ünvanı',
                    controller: _companyNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Firma adı boş bırakılamaz';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  
                  // Vergi Numarası
                  CustomTextField(
                    hintText: 'Vergi No',
                    controller: _taxNumberController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vergi numarası boş bırakılamaz';
                      }
                      if (value.length != 10) {
                        return 'Vergi numarası 10 haneli olmalıdır';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  
                  // Firma Adresi - Şehir ve İlçe seçimi
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Firma Adresi',
                        style: AppTextStyles.inputLabel,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          // Şehir seçimi
                          Expanded(
                            child: LocationSelector(
                              title: 'Şehir',
                              selectedValue: _selectedCity,
                              options: _cities,
                              onSelected: (city) {
                                setState(() {
                                  _selectedCity = city;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          // İlçe seçimi
                          Expanded(
                            child: LocationSelector(
                              title: 'İlçe',
                              selectedValue: _selectedDistrict,
                              options: _districts,
                              onSelected: (district) {
                                setState(() {
                                  _selectedDistrict = district;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      
                      // Açık adres alanı
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.grey.shade700,
                            width: 1,
                          ),
                        ),
                        child: TextFormField(
                          controller: _addressController,
                          maxLines: 3,
                          style: AppTextStyles.bodyText,
                          decoration: InputDecoration(
                            hintText: 'Açık adres...',
                            hintStyle: AppTextStyles.inputLabel.copyWith(
                              color: Colors.grey.shade500,
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.all(12),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Açık adres boş bırakılamaz';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  
                  // Devam butonu
                  CustomButton(
                    text: 'Devam',
                    onPressed: _submitForm,
                    icon: Icons.arrow_forward,
                    showIcon: false,
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