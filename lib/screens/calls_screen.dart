import 'package:flutter/material.dart';
import '../data/calls_data.dart';
import '../widgets/call_tile.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),

      // ── AppBar ─────────────────────────────────────────────────────────
      appBar: AppBar(
        backgroundColor: const Color(0xFF111111),
        elevation: 0,
        title: const Text(
          'Appels',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.5,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt_outlined, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),

      // ── Corps défilant ─────────────────────────────────────────────────
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          // Boutons rapides
          _buildQuickActions(),

          // Section "Récents"
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 12, 16, 6),
            child: Text(
              'Récents',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          // Liste des appels
          ...recentCalls.map(
            (call) => Column(
              children: [
                CallTile(call: call),
                const Divider(
                  color: Color(0xFF1A1A1A),
                  height: 1,
                  indent: 72,
                ),
              ],
            ),
          ),

          const SizedBox(height: 80),
        ],
      ),

      // ── FAB ────────────────────────────────────────────────────────────
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {},
        child: const Icon(Icons.add_call, color: Color(0xFF111111), size: 26),
      ),
    );
  }

  // ── 4 boutons d'action rapide ─────────────────────────────────────────────

  Widget _buildQuickActions() {
    final actions = [
      {'icon': Icons.call_outlined, 'label': 'Appeler'},
      {'icon': Icons.calendar_today_outlined, 'label': 'Planifier'},
      {'icon': Icons.dialpad, 'label': 'Clavier'},
      {'icon': Icons.favorite_border, 'label': 'Favoris'},
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: actions.map((a) {
          return Column(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  color: Color(0xFF1F1F1F),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  a['icon'] as IconData,
                  color: Colors.white,
                  size: 26,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                a['label'] as String,
                style: const TextStyle(
                  color: Color(0xFFAAAAAA),
                  fontSize: 12,
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}