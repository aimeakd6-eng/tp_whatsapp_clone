import 'package:flutter/material.dart';

class Conversation {
  final String name;
  final String lastMessage;
  final String time;
  final Color avatarColor;
  final String avatarInitial;
  final bool isPinned;
  final bool isRead;
  final int unreadCount;
  final bool isSent;
  final bool isDelivered;

  const Conversation({
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.avatarColor,
    required this.avatarInitial,
    this.isPinned = false,
    this.isRead = true,
    this.unreadCount = 0,
    this.isSent = false,
    this.isDelivered = false,
  });
}