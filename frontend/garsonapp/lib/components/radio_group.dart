import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class RadioOption {
  final String title;
  final dynamic value;

  RadioOption({required this.title, required this.value});
}

class CustomRadioGroup<T> extends StatelessWidget {
  final List<RadioOption> options;
  final T groupValue;
  final void Function(T?) onChanged;
  final bool horizontal;

  const CustomRadioGroup({
    Key? key,
    required this.options,
    required this.groupValue,
    required this.onChanged,
    this.horizontal = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Radyo butonlarının düzenini belirler (yatay/dikey)
    final direction = horizontal
        ? Axis.horizontal
        : Axis.vertical;

    // RadioOption listesini RadioListTile widget'larına dönüştürür
    final radioItems = options.map((option) {
      return Expanded(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
            color: option.value == groupValue 
                ? AppColors.primaryColor.withOpacity(0.2)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: option.value == groupValue 
                  ? AppColors.primaryColor 
                  : Colors.grey.shade700,
              width: 1.0,
            ),
          ),
          child: InkWell(
            onTap: () {
              onChanged(option.value as T);
            },
            borderRadius: BorderRadius.circular(8.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    option.title,
                    style: AppTextStyles.bodyText.copyWith(
                      color: option.value == groupValue 
                          ? Colors.white 
                          : Colors.grey.shade400,
                    ),
                  ),
                  const SizedBox(width: 4),
                  if (option.value == groupValue)
                    Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.secondaryColor,
                      ),
                      child: const Icon(
                        Icons.check,
                        size: 12,
                        color: Colors.white,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      );
    }).toList();

    // Yatay veya dikey olarak radyo butonlarını görüntüler
    return Flex(
      direction: direction,
      mainAxisAlignment: MainAxisAlignment.center,
      children: radioItems,
    );
  }
} 