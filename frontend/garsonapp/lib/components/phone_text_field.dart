import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class PhoneTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const PhoneTextField({
    Key? key,
    required this.controller,
    this.hintText = 'Telefon Numarası',
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      style: AppTextStyles.bodyText,
      inputFormatters: [
        // Sadece rakam girişine izin verir
        FilteringTextInputFormatter.digitsOnly,
        // 10 karakter sınırlaması (alan kodu hariç)
        LengthLimitingTextInputFormatter(10),
      ],
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.inputLabel.copyWith(color: Colors.grey),
        filled: true,
        fillColor: Colors.transparent,
        // Telefon numarası simgesi
        prefixIcon: Container(
          width: 70,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(right: 8),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            "+90",
            style: AppTextStyles.bodyText.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // Geçerli telefon numarası gösterimi
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }
} 