import 'package:flutter/material.dart';
import '../models/actus.dart';

const List<Status> statuses = [
  Status(
    name: 'Ajouter un\nstatut',
    avatarColor: Color(0xFF2A2A2A),
    avatarInitial: '',
    isOwn: true,
  ),
  Status(
    name: 'Pascal Dansi',
    avatarColor: Color(0xFF1A6B3A),
    avatarInitial: 'P',
    hasNew: true,
  ),
  Status(
    name: 'Sageo Akd',
    avatarColor: Color(0xFF444444),
    avatarInitial: 'S',
    hasNew: true,
  ),
  Status(
    name: 'Fadit',
    avatarColor: Color(0xFF003D82),
    avatarInitial: 'F',
    hasNew: true,
  ),
  Status(
    name: 'Lina',
    avatarColor: Color(0xFFE91E8C),
    avatarInitial: 'L',
    hasNew: true,
  ),
];

const List<Channel> channels = [
  Channel(
    name: 'MotoGP™ 🏁',
    lastMessage: 'Best MotoGP Moments 👉 https://...',
    time: '18:02',
    avatarColor: Color(0xFF111111),
    avatarInitial: 'M',
    unreadCount: 295,
    messageIcon: Icons.link,
  ),
  Channel(
    name: 'J.Toulan Doc',
    lastMessage: '3Millions de FCFA grâce aux Produi...',
    time: '17:21',
    avatarColor: Color(0xFF1A1A2E),
    avatarInitial: 'J',
    unreadCount: 2,
    messageIcon: Icons.image_outlined,
  ),
  Channel(
    name: 'Paisible Kabongé Chandler',
    lastMessage: 'Vous avez été bloqué. vous n\'aviez...',
    time: '15:56',
    avatarColor: Color(0xFF8E44AD),
    avatarInitial: 'PK',
    unreadCount: 34,
    messageIcon: Icons.info_outline,
  ),
  Channel(
    name: 'TVC BÉNIN',
    lastMessage: 'LA REVUE DE PRESSE HEBDOM...',
    time: '15:5',
    avatarColor: Color(0xFFE53935),
    avatarInitial: 'TV',
    unreadCount: 305,
    messageIcon: Icons.link,
  ),
  Channel(
    name: 'Jacques YAO | Dr IA',
    lastMessage: 'Ah! C\'est la seule solution si tu n\'as...',
    time: '15:2',
    avatarColor: Color(0xFF2C3E50),
    avatarInitial: 'JY',
    unreadCount: 99,
    messageIcon: Icons.image_outlined,
  ),
];