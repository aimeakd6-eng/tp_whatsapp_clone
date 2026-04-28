import 'package:flutter/material.dart';
import '../models/call.dart';

const List<Call> recentCalls = [
  Call(
    name: 'Eudoxie Akd🤩🌹',
    time: "Aujourd'hui, 19:12",
    type: CallType.audioIncoming,
    avatarColor: Color(0xFF5D4037),
    avatarInitial: 'E',
  ),
  Call(
    name: 'Eudoxie Akd🤩🌹',
    time: "Aujourd'hui, 19:11",
    type: CallType.videoMissed,
    avatarColor: Color(0xFF5D4037),
    avatarInitial: 'E',
  ),
  Call(
    name: 'Eudoxie Akd🤩🌹',
    time: "Aujourd'hui, 19:11",
    type: CallType.audioMissed,
    avatarColor: Color(0xFF5D4037),
    avatarInitial: 'E',
    count: 2,
  ),
  Call(
    name: 'Judith Amekpo',
    time: "Aujourd'hui, 11:00",
    type: CallType.audioOutgoing,
    avatarColor: Color(0xFF1A6B3A),
    avatarInitial: 'J',
    count: 2,
  ),
  Call(
    name: 'Judith Amekpo',
    time: 'Hier, 07:15',
    type: CallType.audioIncoming,
    avatarColor: Color(0xFF1A6B3A),
    avatarInitial: 'J',
  ),
  Call(
    name: 'Judith Amekpo',
    time: '24 avril, 20:43',
    type: CallType.audioMissed,
    avatarColor: Color(0xFF1A6B3A),
    avatarInitial: 'J',
  ),
  Call(
    name: '+229 66 51 75 56',
    subtitle: '~ judithamekpo',
    time: '24 avril, 20:37',
    type: CallType.audioMissed,
    avatarColor: Color(0xFF1A6B3A),
    avatarInitial: 'J',
  ),
];