import 'package:flutter/material.dart';
import '../components/custom_button.dart';
import '../components/custom_text_field.dart';
import '../components/phone_text_field.dart';
import '../components/date_selector.dart';
import '../components/radio_group.dart';
import '../components/location_selector.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class GarsonRegisterScreen extends StatefulWidget {
  const GarsonRegisterScreen({Key? key}) : super(key: key);

  @override
  State<GarsonRegisterScreen> createState() => _GarsonRegisterScreenState();
}

class _GarsonRegisterScreenState extends State<GarsonRegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  
  // Text controller'ları
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  
  // Cinsiyet seçimi için değişkenler
  String _gender = 'KADIN'; // Varsayılan değer
  
  // Doğum tarihi için değişkenler
  int? _selectedDay;
  int? _selectedMonth;
  int? _selectedYear;
  
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
    _nameController.dispose();
    _surnameController.dispose();
    super.dispose();
  }

  // Kayıt formu gönderimi
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form doğrulama başarılı ise kayıt işlemi gerçekleştirilir
      // Burada API çağrısı yapılabilir
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Kayıt işlemi başarılı!')),
      );
      
      // Başarılı kayıt sonrası yönlendirme eklenebilir
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      // Sol üst köşeye geri dönüş oku ekliyoruz
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Garson Kaydı', style: AppTextStyles.subheading),
      ),
      body: SafeArea(
        child: Center( // İçeriği ortalıyoruz
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Dikeyde ortalama
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
                  
                  // İsim ve soyisim alanları
                  Row(
                    children: [
                      // İsim alanı
                      Expanded(
                        child: CustomTextField(
                          hintText: 'Adınız',
                          controller: _nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ad alanı boş bırakılamaz';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Soyisim alanı
                      Expanded(
                        child: CustomTextField(
                          hintText: 'Soyadınız',
                          controller: _surnameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Soyad alanı boş bırakılamaz';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  
                  // Cinsiyet seçimi
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cinsiyet',
                        style: AppTextStyles.inputLabel,
                      ),
                      const SizedBox(height: 8),
                      CustomRadioGroup<String>(
                        options: [
                          RadioOption(title: 'KADIN', value: 'KADIN'),
                          RadioOption(title: 'ERKEK', value: 'ERKEK'),
                        ],
                        groupValue: _gender,
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _gender = value;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  
                  // Doğum tarihi seçimi
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Doğum Tarihi',
                        style: AppTextStyles.inputLabel,
                      ),
                      const SizedBox(height: 8),
                      DateSelector(
                        onDateSelected: (day, month, year) {
                          setState(() {
                            _selectedDay = day;
                            _selectedMonth = month;
                            _selectedYear = year;
                          });
                        },
                        selectedDay: _selectedDay,
                        selectedMonth: _selectedMonth,
                        selectedYear: _selectedYear,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  
                  // Adres - Şehir ve İlçe seçimi
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Adres',
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