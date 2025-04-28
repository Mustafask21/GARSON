import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Örnek bildirim listesi
    final List<NotificationItem> notifications = [
      NotificationItem(
        sender: 'Ayşe Yılmaz',
        message: 'Ayşe Hanım\'ın çalışması hakkında ne düşünüyorsunuz?',
        time: '10:45',
        avatar: 'https://randomuser.me/api/portraits/women/32.jpg',
      ),
      NotificationItem(
        sender: 'Zeynep Demir',
        message: 'Zeynep Hanım\'ın çalışması hakkında ne düşünüyorsunuz?',
        time: '09:30',
        avatar: 'https://randomuser.me/api/portraits/women/44.jpg',
      ),
      NotificationItem(
        sender: 'Ayşe Yılmaz',
        message: 'Ayşe Hanım\'ın çalışması hakkında ne düşünüyorsunuz?',
        time: '08:15',
        avatar: 'https://randomuser.me/api/portraits/women/32.jpg',
      ),
      NotificationItem(
        sender: 'Zeynep Demir',
        message: 'Zeynep Hanım\'ın çalışması hakkında ne düşünüyorsunuz?',
        time: '07:50',
        avatar: 'https://randomuser.me/api/portraits/women/44.jpg',
      ),
      NotificationItem(
        sender: 'Ayşe Yılmaz',
        message: 'Ayşe Hanım\'ın çalışması hakkında ne düşünüyorsunuz?',
        time: 'Dün',
        avatar: 'https://randomuser.me/api/portraits/women/32.jpg',
      ),
      NotificationItem(
        sender: 'Ayşe Yılmaz',
        message: 'Ayşe Hanım\'ın çalışması hakkında ne düşünüyorsunuz?',
        time: 'Dün',
        avatar: 'https://randomuser.me/api/portraits/women/32.jpg',
      ),
      NotificationItem(
        sender: 'Zeynep Demir',
        message: 'Zeynep Hanım\'ın çalışması hakkında ne düşünüyorsunuz?',
        time: 'Dün',
        avatar: 'https://randomuser.me/api/portraits/women/44.jpg',
      ),
      NotificationItem(
        sender: 'Ayşe Yılmaz',
        message: 'Ayşe Hanım\'ın çalışması hakkında ne düşünüyorsunuz?',
        time: '8 Nis',
        avatar: 'https://randomuser.me/api/portraits/women/32.jpg',
      ),
      NotificationItem(
        sender: 'Zeynep Demir',
        message: 'Zeynep Hanım\'ın çalışması hakkında ne düşünüyorsunuz?',
        time: '7 Nis',
        avatar: 'https://randomuser.me/api/portraits/women/44.jpg',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: [
            const Text(
              'Bildirimler',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            IconButton(
              icon: Icon(Icons.notifications_active, color: Colors.purple[400]),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return _buildNotificationItem(context, notifications[index]);
        },
      ),
    );
  }

  Widget _buildNotificationItem(BuildContext context, NotificationItem notification) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black12, width: 0.5),
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(notification.avatar),
          radius:
          
          24,
        ),
        title: Text(
          notification.sender,
          style: TextStyle(
            color: Colors.purple[400],
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              notification.message,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'Lütfen bu bildirime hızlıca cevap vermenizi değerlendirin.',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }
}

class NotificationItem {
  final String sender;
  final String message;
  final String time;
  final String avatar;

  NotificationItem({
    required this.sender,
    required this.message,
    required this.time,
    required this.avatar,
  });
} 