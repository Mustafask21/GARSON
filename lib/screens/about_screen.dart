import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hakkımızda'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/logo.png'),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Garson Uygulaması',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              'Biz Kimiz?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Garson uygulaması, restoran ve kafelerin sipariş süreçlerini dijitalleştirmek için tasarlanmış yenilikçi bir çözümdür. Müşterilerin siparişlerini hızlı ve kolay bir şekilde verebilmesini sağlayan uygulamamız, işletmelerin verimliliğini artırmayı hedeflemektedir.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              'Misyonumuz',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Restoran ve kafelerin dijital dönüşümüne öncülük ederek, müşteri deneyimini en üst seviyeye çıkarmak ve işletmelerin operasyonel verimliliğini artırmak.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              'Vizyonumuz',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Türkiye\'nin önde gelen dijital sipariş platformu olmak ve sektörde standart haline gelmek.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
} 