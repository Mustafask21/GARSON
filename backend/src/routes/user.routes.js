const express = require('express');
const router = express.Router();
const userController = require('../controllers/user.controller');
const authMiddleware = require('../middlewares/auth.middleware');

// Tüm kullanıcıları getir - sadece admin
router.get(
  '/',
  authMiddleware.protect,
  authMiddleware.authorize('admin'),
  userController.getAllUsers
);

// Kullanıcı ID'sine göre getir
router.get(
  '/:id',
  authMiddleware.protect,
  userController.getUserById
);

// Kullanıcı profilini güncelle
router.put(
  '/:id',
  authMiddleware.protect,
  userController.updateUserProfile
);

// Kullanıcı şifresini güncelle
router.put(
  '/:id/password',
  authMiddleware.protect,
  userController.updatePassword
);

// Kullanıcı sil - sadece admin veya kullanıcının kendisi
router.delete(
  '/:id',
  authMiddleware.protect,
  userController.deleteUser
);

module.exports = router; 