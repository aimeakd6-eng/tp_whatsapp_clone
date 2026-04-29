import 'package:flutter/material.dart';
import '../data/conversations_data.dart';
import '../models/conversation.dart';
import '../widgets/chat_tile.dart';
import 'calls_screen.dart';
import 'actus_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedNavIndex = 0;

  final List<Widget> _screens = const [
    _DiscussionsBody(),
    CallsScreen(),
    ActusScreen(),
    _PlaceholderScreen(label: 'Outils'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      body: IndexedStack(
        index: _selectedNavIndex,
        children: _screens,
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      currentIndex: _selectedNavIndex,
      onTap: (index) => setState(() => _selectedNavIndex = index),
      backgroundColor: const Color(0xFF1A1A1A),
      selectedItemColor: const Color(0xFF25D366),
      unselectedItemColor: const Color(0xFF888888),
      selectedFontSize: 10,
      unselectedFontSize: 10,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(Icons.chat_bubble),
              Positioned(
                top: -6,
                right: -10,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                  decoration: BoxDecoration(
                    color: const Color(0xFF25D366),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text('99+',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.w700)),
                ),
              ),
            ],
          ),
          label: 'Discussions',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.call),
          label: 'Appels',
        ),
        BottomNavigationBarItem(
          icon: Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(Icons.circle_notifications_outlined),
              Positioned(
                top: -2,
                right: -2,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: const Color(0xFF25D366),
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFF1A1A1A), width: 1.5),
                  ),
                ),
              ),
            ],
          ),
          label: 'Actus',
        ),
        BottomNavigationBarItem(
          icon: Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(Icons.grid_view),
              Positioned(
                top: -2,
                right: -2,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: const Color(0xFF25D366),
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFF1A1A1A), width: 1.5),
                  ),
                ),
              ),
            ],
          ),
          label: 'Outils',
        ),
      ],
    );
  }
}

// ── Page Discussions ──────────────────────────────────────────────────────────

class _DiscussionsBody extends StatefulWidget {
  const _DiscussionsBody();

  @override
  State<_DiscussionsBody> createState() => _DiscussionsBodyState();
}

class _DiscussionsBodyState extends State<_DiscussionsBody> {
  int _selectedFilter = 0;
  final List<String> _filters = ['Toutes', 'Non lues', 'Favoris', 'Groupes'];

  // ── Recherche ──────────────────────────────────────────────────────────────
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  bool _isSearching = false;

  List<Conversation> get _filteredConversations {
    List<Conversation> result = conversations;

    // Filtre par onglet
    if (_selectedFilter == 1) {
      result = result.where((c) => c.unreadCount > 0).toList();
    } else if (_selectedFilter == 2) {
      result = result.where((c) => c.isPinned).toList();
    } else if (_selectedFilter == 3) {
      result = result.where((c) => c.avatarInitial.length > 1).toList();
    }

    // Filtre par recherche
    if (_searchQuery.isNotEmpty) {
      result = result
          .where((c) =>
              c.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
              c.lastMessage.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    }

    return result;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF111111),
        elevation: 0,
        title: _isSearching
            ? TextField(
                controller: _searchController,
                autofocus: true,
                style: const TextStyle(color: Colors.white, fontSize: 16),
                decoration: const InputDecoration(
                  hintText: 'Rechercher...',
                  hintStyle: TextStyle(color: Color(0xFF888888)),
                  border: InputBorder.none,
                ),
                onChanged: (value) => setState(() => _searchQuery = value),
              )
            : const Text(
                'WhatsApp',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5,
                ),
              ),
        actions: [
          if (!_isSearching) ...[
            IconButton(
              icon: const Icon(Icons.camera_alt_outlined, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () => setState(() => _isSearching = true),
            ),
            IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.white),
              onPressed: () {},
            ),
          ] else ...[
            IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () {
                setState(() {
                  _isSearching = false;
                  _searchQuery = '';
                  _searchController.clear();
                });
              },
            ),
          ],
        ],
      ),
      body: Column(
        children: [
          // Barre de recherche fixe (quand pas en mode search dans AppBar)
          if (!_isSearching) _buildSearchBar(),
          _buildFilterTabs(),
          Expanded(
            child: _filteredConversations.isEmpty
                ? _buildEmptyState()
                : ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      if (!_isSearching) _buildArchivedRow(),
                      ..._filteredConversations.map(
                        (conv) => Column(
                          children: [
                            ChatTile(conversation: conv),
                            const Divider(
                                color: Color(0xFF1A1A1A), height: 1, indent: 72),
                          ],
                        ),
                      ),
                      const SizedBox(height: 80),
                    ],
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF25D366),
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }

  // ── État vide (aucun résultat) ─────────────────────────────────────────────

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.search_off, color: Colors.white.withOpacity(0.2), size: 64),
          const SizedBox(height: 16),
          Text(
            'Aucun résultat pour\n"$_searchQuery"',
            textAlign: TextAlign.center,
            style: const TextStyle(color: Color(0xFF888888), fontSize: 15),
          ),
        ],
      ),
    );
  }

  // ── Barre de recherche ────────────────────────────────────────────────────

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 4, 12, 8),
      child: GestureDetector(
        onTap: () => setState(() => _isSearching = true),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1F1F1F),
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: const Row(
            children: [
              Icon(Icons.search, color: Color(0xFF888888), size: 20),
              SizedBox(width: 10),
              Text(
                'Rechercher...',
                style: TextStyle(color: Color(0xFF888888), fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── Onglets de filtre ─────────────────────────────────────────────────────

  Widget _buildFilterTabs() {
    return SizedBox(
      height: 44,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: _filters.length,
        itemBuilder: (context, index) {
          final isSelected = _selectedFilter == index;
          final isNonLues = index == 1;
          return GestureDetector(
            onTap: () => setState(() => _selectedFilter = index),
            child: Container(
              margin: const EdgeInsets.only(right: 8, bottom: 8),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF25D366) : const Color(0xFF1F1F1F),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Text(
                    _filters[index],
                    style: TextStyle(
                      color: isSelected ? Colors.white : const Color(0xFFAAAAAA),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (isNonLues) ...[
                    const SizedBox(width: 5),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.white24 : const Color(0xFF25D366),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Plus de 99',
                        style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // ── Ligne Archivées ───────────────────────────────────────────────────────

  Widget _buildArchivedRow() {
    return Column(
      children: [
        ListTile(
          leading: Container(
            width: 44,
            height: 44,
            decoration: const BoxDecoration(color: Color(0xFF1F1F1F), shape: BoxShape.circle),
            child: const Icon(Icons.archive_outlined, color: Color(0xFF888888), size: 20),
          ),
          title: const Text('Archivées', style: TextStyle(color: Color(0xFF888888), fontSize: 14)),
          trailing: const Icon(Icons.more_horiz, color: Color(0xFF888888), size: 18),
          onTap: () {},
        ),
        const Divider(color: Color(0xFF1E1E1E), height: 1),
      ],
    );
  }
}

// ── Placeholder ───────────────────────────────────────────────────────────────

class _PlaceholderScreen extends StatelessWidget {
  final String label;
  const _PlaceholderScreen({required this.label});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF111111),
        elevation: 0,
        title: Text(label, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700)),
      ),
      body: Center(
        child: Text('Page $label\n(à développer)',
            textAlign: TextAlign.center,
            style: const TextStyle(color: Color(0xFF888888), fontSize: 16)),
      ),
    );
  }
}