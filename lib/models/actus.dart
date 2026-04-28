import 'package:flutter/material.dart';

class Status {
  final String name;
  final Color avatarColor;
  final String avatarInitial;
  final bool isOwn;
  final bool hasNew;

  const Status({
    required this.name,
    required this.avatarColor,
    required this.avatarInitial,
    this.isOwn = false,
    this.hasNew = false,
  });
}

class Channel {
  final String name;
  final String lastMessage;
  final String time;
  final Color avatarColor;
  final String avatarInitial;
  final int unreadCount;
  final IconData messageIcon;

  const Channel({
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.avatarColor,
    required this.avatarInitial,
    this.unreadCount = 0,
    this.messageIcon = Icons.link,
  });
}