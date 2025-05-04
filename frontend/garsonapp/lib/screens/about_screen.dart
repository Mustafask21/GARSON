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
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                height: 150,
                width: 150,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'GARSON Uygulaması',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'GARSON, restoran, kafe ve diğer yeme-içme işletmeleri ile müşteriler arasında bağlantı kurmayı kolaylaştıran bir platformdur.',
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
            const SizedBox(height: 12),
            const Text(
              'Restoran ve kafe deneyimini hem müşteriler hem de işletmeler için daha verimli ve keyifli hale getirmek. GARSON, masa rezervasyonlarını kolaylaştırır, bekleme sürelerini azaltır ve garsonların işini kolaylaştırır.',
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
            const SizedBox(height: 12),
            const Text(
              'Yeme-içme sektöründe dijital dönüşümün öncüsü olmak ve yenilikçi çözümlerle sektörün geleceğini şekillendirmek.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              'Değerlerimiz',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _buildValueItem(context, 'Yenilikçilik', 'Sürekli olarak yeni fikirler ve çözümler geliştiriyoruz.'),
            _buildValueItem(context, 'Müşteri Odaklılık', 'Her kararımızda müşteri deneyimini ön planda tutuyoruz.'),
            _buildValueItem(context, 'Kalite', 'Ürün ve hizmetlerimizde en yüksek kaliteyi sunmak için çalışıyoruz.'),
            _buildValueItem(context, 'İşbirliği', 'İşletmelerle yakın işbirliği içinde çalışarak karşılıklı başarıyı hedefliyoruz.'),
            const SizedBox(height: 24),
            const Text(
              'Ekibimiz',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'GARSON, yeme-içme sektöründeki sorunları çözmek için bir araya gelmiş, teknoloji ve hizmet sektörü tecrübesi olan uzmanlardan oluşan bir ekip tarafından geliştirilmiştir.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            const Center(
              child: Text(
                '© 2024 GARSON. Tüm hakları saklıdır.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildValueItem(BuildContext context, String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
} 