import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class LocationSelector extends StatelessWidget {
  final String title;
  final String selectedValue;
  final List<String> options;
  final Function(String) onSelected;
  
  const LocationSelector({
    Key? key,
    required this.title,
    required this.selectedValue,
    required this.options,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        // Seçenekler listesini dialog olarak göster
        final result = await showDialog<String>(
          context: context,
          builder: (context) => LocationPickerDialog(
            title: title,
            options: options,
            selectedValue: selectedValue,
          ),
        );
        
        // Eğer bir değer seçildiyse callback'i çağır
        if (result != null) {
          onSelected(result);
        }
      },
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 24,
        ),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          selectedValue.isEmpty ? title : selectedValue,
          style: AppTextStyles.bodyText,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

// Konum seçimi için dialog
class LocationPickerDialog extends StatelessWidget {
  final String title;
  final List<String> options;
  final String selectedValue;

  const LocationPickerDialog({
    Key? key,
    required this.title,
    required this.options,
    required this.selectedValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: AppTextStyles.subheading,
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount: options.length,
                itemBuilder: (context, index) {
                  final option = options[index];
                  final isSelected = option == selectedValue;
                  
                  return ListTile(
                    title: Text(
                      option,
                      style: AppTextStyles.bodyText.copyWith(
                        color: isSelected 
                            ? AppColors.primaryColor 
                            : AppColors.textColor,
                      ),
                    ),
                    selected: isSelected,
                    onTap: () {
                      Navigator.of(context).pop(option);
                    },
                    trailing: isSelected 
                        ? const Icon(
                            Icons.check,
                            color: AppColors.primaryColor,
                          ) 
                        : null,
                  );
                },
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('İptal'),
            ),
          ],
        ),
      ),
    );
  }
} 