import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class GarsonLogo extends StatelessWidget {
  final double size;
  
  const GarsonLogo({
    Key? key,
    this.size = 40.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Logo ikonu (çizim veya Icon widget kullanılabilir)
        Icon(
          Icons.restaurant_menu,
          color: AppColors.secondaryColor,
          size: size,
        ),
        const SizedBox(width: 8),
        // Logo yazısı
        Text(
          'Garson',
          style: TextStyle(
            color: Colors.white,
            fontSize: size * 0.8,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class GradientBar extends StatelessWidget {
  final double height;
  
  const GradientBar({
    Key? key,
    this.height = 4.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.gradientColors,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    );
  }
} 