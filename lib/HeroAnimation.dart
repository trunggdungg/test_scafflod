import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeroAnimationExamplePage extends StatefulWidget {
  const HeroAnimationExamplePage({super.key});

  @override
  State<HeroAnimationExamplePage> createState() =>
      _HeroAnimationExamplePageState();
}

class _HeroAnimationExamplePageState
    extends State<HeroAnimationExamplePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const DrawerHeader(child: Text("Xin chào")),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Hero Animation Example'),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          heroHomeTab(context),
          const Center(child: Text('Profile Page')),
        ],
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.blue,
        style: TabStyle.react,
        initialActiveIndex: _selectedIndex,
        onTap: (int i) {
          setState(() => _selectedIndex = i);
        },
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
      ),
    );
  }

  /// HOME TAB – HERO ANIMATION
  Widget heroHomeTab(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _heroItem(
            context,
            tag: 'hero-1',
            image: 'assets/images/tanjiro-kamado-6082x5416-23027.jpg',
          ),
          const SizedBox(width: 20),
          _heroItem(
            context,
            tag: 'hero-2',
            image: 'assets/images/tanjiro-kamado-6082x5416-23027.jpg',
          ),
        ],
      ),
    );
  }

  Widget _heroItem(
      BuildContext context, {
        required String tag,
        required String image,
      }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => HeroDetailPage(tag: tag, image: image),
          ),
        );
      },
      child: Hero(
        tag: tag,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            image,
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

}



class HeroDetailPage extends StatelessWidget {
  const HeroDetailPage({
    super.key,
    required this.tag,
    required this.image,
  });

  final String tag;
  final String image;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hero Detail')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Hero(
                tag: tag,
                child: Image.asset(
                  image,
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Hero tag: $tag',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
