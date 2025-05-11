const jwt = require('jsonwebtoken');
const User = require('../models/user.model');

// JWT token doğrulama middleware'i
exports.protect = async (req, res, next) => {
  let token;
  
  // Token'ı header'dan al
  if (
    req.headers.authorization &&
    req.headers.authorization.startsWith('Bearer')
  ) {
    token = req.headers.authorization.split(' ')[1];
  }
  
  // Token yoksa hata döndür
  if (!token) {
    return res.status(401).json({
      success: false,
      error: 'Bu işlemi yapmak için giriş yapmalısınız'
    });
  }
  
  try {
    // Token'ı doğrula
    const decoded = jwt.verify(
      token,
      process.env.JWT_SECRET || 'garson_super_gizli_anahtar'
    );
    
    // Kullanıcıyı bul
    const user = await User.findById(decoded.id);
    
    if (!user) {
      return res.status(401).json({
        success: false,
        error: 'Kullanıcı bulunamadı'
      });
    }
    
    // Kullanıcı bilgisini request'e ekle
    req.user = user;
    next();
  } catch (error) {
    return res.status(401).json({
      success: false,
      error: 'Yetkisiz erişim'
    });
  }
};

// Rol bazlı yetkilendirme
exports.authorize = (...roles) => {
  return (req, res, next) => {
    if (!roles.includes(req.user.role)) {
      return res.status(403).json({
        success: false,
        error: 'Bu işlemi yapmak için yetkiniz yok'
      });
    }
    next();
  };
}; 