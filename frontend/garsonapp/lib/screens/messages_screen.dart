import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final List<MessageItem> _messages = [
    MessageItem(
      name: 'Ahmet Yılmaz',
      message: 'Merhaba, yarın için rezervasyon yapabilir miyim?',
      time: '13:45',
      isRead: false,
      avatar: 'https://randomuser.me/api/portraits/men/1.jpg',
    ),
    MessageItem(
      name: 'Ayşe Demir',
      message: 'Menü değişikliği hakkında bilgi alabilir miyim?',
      time: '12:30',
      isRead: true,
      avatar: 'https://randomuser.me/api/portraits/women/2.jpg',
    ),
    MessageItem(
      name: 'Mehmet Kaya',
      message: 'Bugün için özel bir menünüz var mı?',
      time: 'Dün',
      isRead: true,
      avatar: 'https://randomuser.me/api/portraits/men/3.jpg',
    ),
    MessageItem(
      name: 'Zeynep Çelik',
      message: 'Rezervasyonumu iptal etmek istiyorum',
      time: 'Dün',
      isRead: true,
      avatar: 'https://randomuser.me/api/portraits/women/4.jpg',
    ),
    MessageItem(
      name: 'Ali Yıldız',
      message: 'Teşekkürler, harika bir hizmetti',
      time: '23 May',
      isRead: true,
      avatar: 'https://randomuser.me/api/portraits/men/5.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Başlık
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Text(
              'Mesajlar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
          // Arama çubuğu
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF1D2139),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Mesajlarda ara...',
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white.withOpacity(0.5),
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Mesaj listesi
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              return _buildMessageItem(_messages[index]);
            },
          ),
        ],
      ),
    );
  }
  
  Widget _buildMessageItem(MessageItem message) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF1D2139),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          radius: 24,
          backgroundImage: NetworkImage(message.avatar),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                message.name,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: message.isRead ? FontWeight.normal : FontWeight.bold,
                ),
              ),
            ),
            Text(
              message.time,
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 12,
              ),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  message.message,
                  style: TextStyle(
                    color: message.isRead ? Colors.white.withOpacity(0.7) : Colors.white,
                    fontWeight: message.isRead ? FontWeight.normal : FontWeight.w500,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
              ),
              if (!message.isRead)
                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFB356FF),
                  ),
                ),
            ],
          ),
        ),
        onTap: () {
          // Mesaj detayına git
        },
      ),
    );
  }
}

class MessageItem {
  final String name;
  final String message;
  final String time;
  final bool isRead;
  final String avatar;

  MessageItem({
    required this.name,
    required this.message,
    required this.time,
    required this.isRead,
    required this.avatar,
  });
} 