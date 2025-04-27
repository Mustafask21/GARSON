import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class DateSelector extends StatelessWidget {
  final void Function(int, int, int) onDateSelected;
  final int? selectedDay;
  final int? selectedMonth;
  final int? selectedYear;

  const DateSelector({
    Key? key,
    required this.onDateSelected,
    this.selectedDay,
    this.selectedMonth,
    this.selectedYear,
  }) : super(key: key);

  // Ay isimlerini içeren liste
  static const List<String> monthNames = [
    'Ocak', 'Şubat', 'Mart', 'Nisan', 'Mayıs', 'Haziran', 
    'Temmuz', 'Ağustos', 'Eylül', 'Ekim', 'Kasım', 'Aralık'
  ];

  // Ay, gün ve yıl için buton stilini belirler
  Widget _buildDateButton({
    required String text,
    required String selectedText,
    required bool isSelected,
    required VoidCallback onPressed,
  }) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: isSelected
                ? AppColors.primaryColor
                : Colors.transparent,
            foregroundColor: Colors.white,
            elevation: isSelected ? 2 : 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(
                color: isSelected
                    ? AppColors.primaryColor
                    : Colors.grey.shade700,
                width: 1.0,
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10),
          ),
          child: Text(
            isSelected ? selectedText : text,
            style: AppTextStyles.bodyText.copyWith(
              color: isSelected
                  ? Colors.white
                  : Colors.grey.shade300,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Gün seçimi butonu
    final dayButton = _buildDateButton(
      text: 'Gün',
      selectedText: selectedDay != null ? selectedDay.toString() : 'Gün',
      isSelected: selectedDay != null,
      onPressed: () async {
        // Gün seçimi için dialog gösterir
        final int? day = await showDialog<int>(
          context: context,
          builder: (context) => const DayPickerDialog(),
        );
        
        if (day != null) {
          onDateSelected(
            day,
            selectedMonth ?? 1,
            selectedYear ?? DateTime.now().year,
          );
        }
      },
    );

    // Ay seçimi butonu
    final monthButton = _buildDateButton(
      text: 'Ay',
      selectedText: selectedMonth != null 
          ? monthNames[selectedMonth! - 1] 
          : 'Ay',
      isSelected: selectedMonth != null,
      onPressed: () async {
        // Ay seçimi için dialog gösterir
        final int? month = await showDialog<int>(
          context: context,
          builder: (context) => const MonthPickerDialog(),
        );
        
        if (month != null) {
          onDateSelected(
            selectedDay ?? 1,
            month,
            selectedYear ?? DateTime.now().year,
          );
        }
      },
    );

    // Yıl seçimi butonu
    final yearButton = _buildDateButton(
      text: 'Yıl',
      selectedText: selectedYear != null 
          ? selectedYear.toString() 
          : 'Yıl',
      isSelected: selectedYear != null,
      onPressed: () async {
        // Yıl seçimi için dialog gösterir
        final int? year = await showDialog<int>(
          context: context,
          builder: (context) => YearPickerDialog(),
        );
        
        if (year != null) {
          onDateSelected(
            selectedDay ?? 1,
            selectedMonth ?? 1,
            year,
          );
        }
      },
    );

    // Gün, ay ve yıl butonlarını bir satırda gösterir
    return Row(
      children: [
        dayButton,
        monthButton,
        yearButton,
      ],
    );
  }
}

// Gün seçimi için dialog
class DayPickerDialog extends StatelessWidget {
  const DayPickerDialog({Key? key}) : super(key: key);

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
              'Gün Seçin',
              style: AppTextStyles.subheading,
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 300,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 31,
                itemBuilder: (context, index) {
                  final day = index + 1;
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pop(day);
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey.shade700,
                          width: 1,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        day.toString(),
                        style: AppTextStyles.bodyText.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
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

// Ay seçimi için dialog
class MonthPickerDialog extends StatelessWidget {
  const MonthPickerDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final months = [
      'Ocak', 'Şubat', 'Mart', 'Nisan', 'Mayıs', 'Haziran', 
      'Temmuz', 'Ağustos', 'Eylül', 'Ekim', 'Kasım', 'Aralık'
    ];

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
              'Ay Seçin',
              style: AppTextStyles.subheading,
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 300,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.0,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: months.length,
                itemBuilder: (context, index) {
                  final month = index + 1;
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pop(month);
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey.shade700,
                          width: 1,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        months[index],
                        style: AppTextStyles.bodyText.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
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

// Yıl seçimi için dialog
class YearPickerDialog extends StatelessWidget {
  YearPickerDialog({Key? key}) : super(key: key);

  final currentYear = DateTime.now().year;
  final startYear = DateTime.now().year - 100;

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
              'Yıl Seçin',
              style: AppTextStyles.subheading,
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 300,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 101, // 100 yıl geriye gider
                itemBuilder: (context, index) {
                  final year = currentYear - index;
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pop(year);
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey.shade700,
                          width: 1,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        year.toString(),
                        style: AppTextStyles.bodyText.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
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