import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class CustomCheckbox extends StatelessWidget {
  final String label;
  final bool value;
  final Function(bool?) onChanged;
  final Color? activeColor;

  const CustomCheckbox({
    Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.activeColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Özel checkbox stili
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Row(
        children: [
          // Checkbox widget
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: value ? (activeColor ?? AppColors.primaryColor) : Colors.transparent,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: value ? (activeColor ?? AppColors.primaryColor) : Colors.grey.shade600,
                width: 2,
              ),
            ),
            child: value
                ? const Icon(
                    Icons.check,
                    size: 16,
                    color: Colors.white,
                  )
                : null,
          ),
          const SizedBox(width: 8),
          // Checkbox etiketi
          Text(
            label,
            style: AppTextStyles.bodyText.copyWith(
              color: value ? Colors.white : Colors.grey.shade400,
            ),
          ),
        ],
      ),
    );
  }
} 