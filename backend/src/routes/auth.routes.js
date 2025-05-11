const express = require('express');
const router = express.Router();
const authController = require('../controllers/auth.controller');
const authMiddleware = require('../middlewares/auth.middleware');

// Kullanıcı kaydı rotası
router.post('/register', authController.register);

// Kullanıcı girişi rotası
router.post('/login', authController.login);

// Mevcut kullanıcı bilgisini getir
router.get('/me', authMiddleware.protect, authController.getCurrentUser);

module.exports = router; 