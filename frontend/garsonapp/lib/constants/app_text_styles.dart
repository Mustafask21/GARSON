import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const TextStyle heading = TextStyle(
    color: AppColors.textColor,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  
  static const TextStyle subheading = TextStyle(
    color: AppColors.textColor,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  
  static const TextStyle bodyText = TextStyle(
    color: AppColors.textColor,
    fontSize: 16,
  );
  
  static const TextStyle buttonText = TextStyle(
    color: AppColors.primaryButtonTextColor,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  
  static const TextStyle secondaryButtonText = TextStyle(
    color: AppColors.secondaryButtonTextColor,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  
  static const TextStyle inputLabel = TextStyle(
    color: AppColors.textColor,
    fontSize: 14,
  );
} 