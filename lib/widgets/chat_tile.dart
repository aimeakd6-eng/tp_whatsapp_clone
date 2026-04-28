import 'package:flutter/material.dart';
import '../models/conversation.dart';
import '../screens/chat_screen.dart';

class ChatTile extends StatelessWidget {
  final Conversation conversation;

  const ChatTile({super.key, required this.conversation});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ChatScreen(
              contactName: conversation.name,
              avatarColor: conversation.avatarColor,
              avatarInitial: conversation.avatarInitial,
            ),
          ),
        );
      },
      splashColor: Colors.white10,
      highlightColor: Colors.white10,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            // ── Avatar ──────────────────────────────────────────────────
            CircleAvatar(
              radius: 26,
              backgroundColor: conversation.avatarColor,
              child: Text(
                conversation.avatarInitial,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(width: 12),

            // ── Contenu ──────────────────────────────────────────────────
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nom + heure
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          conversation.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        conversation.time,
                        style: TextStyle(
                          color: conversation.unreadCount > 0
                              ? const Color(0xFF25D366)
                              : const Color(0xFF888888),
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 3),

                  // Message + badges
                  Row(
                    children: [
                      // Double coche
                      if (conversation.isSent) ...[
                        Icon(
                          Icons.done_all,
                          size: 15,
                          color: conversation.isDelivered
                              ? const Color(0xFF34B7F1)
                              : const Color(0xFF888888),
                        ),
                        const SizedBox(width: 4),
                      ],

                      // Aperçu du message
                      Expanded(
                        child: Text(
                          conversation.lastMessage,
                          style: const TextStyle(
                            color: Color(0xFF888888),
                            fontSize: 13,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),

                      const SizedBox(width: 8),

                      // Badge non lu
                      if (conversation.unreadCount > 0)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: const BoxDecoration(
                            color: Color(0xFF25D366),
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            conversation.unreadCount > 99
                                ? '99+'
                                : '${conversation.unreadCount}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),

                      // Icône épingle
                      if (conversation.isPinned && conversation.unreadCount == 0)
                        const Icon(
                          Icons.push_pin,
                          color: Color(0xFF888888),
                          size: 14,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}