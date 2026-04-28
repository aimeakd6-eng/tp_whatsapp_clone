import 'package:flutter/material.dart';

enum CallType { audioIncoming, audioOutgoing, audioMissed, videoIncoming, videoMissed }

class Call {
  final String name;
  final String subtitle; // numéro ou pseudo alternatif
  final String time;
  final CallType type;
  final Color avatarColor;
  final String avatarInitial;
  final int count; // nb d'appels groupés

  const Call({
    required this.name,
    required this.time,
    required this.type,
    required this.avatarColor,
    required this.avatarInitial,
    this.subtitle = '',
    this.count = 1,
  });

  bool get isMissed =>
      type == CallType.audioMissed || type == CallType.videoMissed;
}