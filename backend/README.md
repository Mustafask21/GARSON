# GARSON Uygulaması Backend

Bu proje, GARSON mobil uygulamasının backend API servisidir. Node.js, Express ve MongoDB kullanılarak geliştirilmiştir.

## Özellikler

- Kullanıcı kaydı ve kimlik doğrulama (JWT token tabanlı)
- Kullanıcı profil yönetimi
- Rol tabanlı yetkilendirme sistemi (kullanıcı, garson, admin)

## Gereksinimler

- Node.js (v14 veya üzeri)
- MongoDB
- npm veya yarn

## Kurulum

1. Repo'yu klonlayın:
```
git clone https://github.com/your-username/garson-backend.git
cd garson-backend
```

2. Bağımlılıkları yükleyin:
```
npm install
```

3. Çevre değişkenlerini ayarlayın:
`.env` dosyası oluşturun ve aşağıdaki değişkenleri tanımlayın:
```
PORT=3000
MONGODB_URI=mongodb://localhost:27017/garson_db
JWT_SECRET=your_jwt_secret
NODE_ENV=development
```

4. Sunucuyu başlatın:
```
npm run dev
```

Sunucu geliştirme modunda 3000 portunda çalışacaktır.

## API Endpoints

### Kimlik Doğrulama

- `POST /api/auth/register` - Yeni kullanıcı kaydı
- `POST /api/auth/login` - Kullanıcı girişi
- `GET /api/auth/me` - Mevcut kullanıcı bilgisini getir (token gerekli)

### Kullanıcı Yönetimi

- `GET /api/users` - Tüm kullanıcıları getir (sadece admin)
- `GET /api/users/:id` - Belirli bir kullanıcıyı getir
- `PUT /api/users/:id` - Kullanıcı profilini güncelle
- `PUT /api/users/:id/password` - Kullanıcı şifresini güncelle
- `DELETE /api/users/:id` - Kullanıcıyı sil

## Güvenlik Önlemleri

- JWT token tabanlı kimlik doğrulama sistemi
- Rol tabanlı yetkilendirme
- Şifre hashleme (bcrypt)
- Helmet ve CORS koruması 