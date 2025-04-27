import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;
  final bool isFullWidth;
  final IconData? icon;
  final bool showIcon;
  
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isPrimary = true,
    this.isFullWidth = true,
    this.icon,
    this.showIcon = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = isPrimary
        ? ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            foregroundColor: AppColors.primaryButtonTextColor,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 3,
            shadowColor: AppColors.primaryColor.withOpacity(0.5),
          )
        : OutlinedButton.styleFrom(
            backgroundColor: AppColors.secondaryButtonColor,
            foregroundColor: AppColors.secondaryButtonTextColor,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 1,
            shadowColor: Colors.black26,
          );

    final TextStyle textStyle = isPrimary
        ? AppTextStyles.buttonText.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          )
        : AppTextStyles.secondaryButtonText.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          );

    final Widget buttonContent = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null && showIcon) ...[
          Icon(icon, size: 22),
          const SizedBox(width: 10),
        ],
        Text(
          text,
          style: textStyle,
          textAlign: TextAlign.center,
        ),
      ],
    );

    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      child: isPrimary
          ? ElevatedButton(
              onPressed: onPressed,
              style: style,
              child: buttonContent,
            )
          : OutlinedButton(
              onPressed: onPressed,
              style: style,
              child: buttonContent,
            ),
    );
  }
} 