import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Divider(color: Colors.white24),
          SizedBox(height: 8),
          Text(
            '© 2025 Garson App. Tüm hakları saklıdır.',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 12,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Versiyon 1.0.0',
            style: TextStyle(
              color: Colors.white38,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
} 