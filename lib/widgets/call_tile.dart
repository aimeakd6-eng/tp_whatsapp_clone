import 'package:flutter/material.dart';
import '../models/call.dart';

class CallTile extends StatelessWidget {
  final Call call;

  const CallTile({super.key, required this.call});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Colors.white10,
      highlightColor: Colors.white10,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            // ── Avatar ──────────────────────────────────────────────────
            CircleAvatar(
              radius: 26,
              backgroundColor: call.avatarColor,
              child: Text(
                call.avatarInitial,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(width: 14),

            // ── Nom + heure ──────────────────────────────────────────────
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    call.count > 1
                        ? '${call.name} (${call.count})'
                        : call.name,
                    style: TextStyle(
                      color: call.isMissed
                          ? const Color(0xFFE53935)
                          : Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (call.subtitle.isNotEmpty) ...[
                    const SizedBox(height: 1),
                    Text(
                      call.subtitle,
                      style: const TextStyle(
                        color: Color(0xFF888888),
                        fontSize: 12,
                      ),
                    ),
                  ],
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      _buildArrow(),
                      const SizedBox(width: 5),
                      Text(
                        call.time,
                        style: const TextStyle(
                          color: Color(0xFF888888),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ── Icône d'action (rappeler) ──────────────────────────────
            IconButton(
              onPressed: () {},
              icon: Icon(
                call.type == CallType.videoMissed
                    ? Icons.videocam_outlined
                    : Icons.call_outlined,
                color: const Color(0xFF25D366),
                size: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArrow() {
    switch (call.type) {
      case CallType.audioIncoming:
        return const Icon(Icons.call_received,
            color: Color(0xFF25D366), size: 14);
      case CallType.audioOutgoing:
        return const Icon(Icons.call_made,
            color: Color(0xFF25D366), size: 14);
      case CallType.audioMissed:
        return const Icon(Icons.call_missed,
            color: Color(0xFFE53935), size: 14);
      case CallType.videoIncoming:
        return const Icon(Icons.video_call,
            color: Color(0xFF25D366), size: 14);
      case CallType.videoMissed:
        return const Icon(Icons.missed_video_call,
            color: Color(0xFFE53935), size: 14);
    }
  }
}