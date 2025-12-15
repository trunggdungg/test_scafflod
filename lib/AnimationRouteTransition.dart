import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class animationRouteTransitionEx extends StatefulWidget {
  const animationRouteTransitionEx({super.key});

  @override
  State<StatefulWidget> createState() {
    return _animationRouteTransitionExState();
  }
}

class _animationRouteTransitionExState
    extends State<animationRouteTransitionEx> {
  int _selectedIndex = 0;
  List<int> data = [];
  int currentLength = 0;
  final int increment = 10;
  bool isLoading = false;

  @override
  void initState() {
    _loadMore();
    super.initState();
  }

  Future _loadMore() async {
    setState(() {
      isLoading = true;
    });

    // Add a delay
    await Future.delayed(const Duration(seconds:1));
    for (var i = currentLength; i <= currentLength + increment; i++) {
      data.add(i);
    }
    setState(() {
      isLoading = false;
      currentLength = data.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Animation Route Transition Example'),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          Center(child: goToPage2Button()),
          Center(child: exInkWellButton()),
          Center(child: layzyLoadingEx()),
        ],
      ),

      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.blue,

        ///type
        style: TabStyle.react,
        activeColor: Colors.white,
        initialActiveIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.message, title: 'Message'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Page2(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }

  Widget goToPage2Button() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      onPressed: () {
        /// Navigate to Page 2 with a custom transition
        // Navigator.push(context,
        //  MaterialPageRoute(
        //      builder: (context) {
        //         return const Page2();
        //      })
        // );

        ///hoặc dùng cách này để tạo hiệu ứng chuyển trang
        Navigator.of(context).push(_createRoute());
      },
      child: const Text('Go to Page 2', style: TextStyle(color: Colors.white)),
    );
  }

  Widget exInkWellButton() {
    return InkWell(
      onTap: () {
        print('Xin chào InkWell');
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Xin chào InkWell')));
      },
      onLongPress: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Bạn đã nhấn giữ InkWell')));
      },
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text('InkWell Button', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  /// lazy load
  Widget layzyLoadingEx() {
    return Column(
      children: [
        Expanded(
          child: LazyLoadScrollView(
            isLoading: isLoading,
            onEndOfPage: () => _loadMore(),
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, position) {
                return DemoItem(position);
              },
            ),
          ),
        ),
        if (isLoading)
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: CircularProgressIndicator(color: Colors.green.shade900),
            ),
          ),
      ],
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: const Center(child: Text('Page 2')),
    );
  }
}

class DemoItem extends StatelessWidget {
  final int position;

  const DemoItem(this.position, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(color: Colors.deepOrange, height: 40.0, width: 40.0),
                SizedBox(width: 8.0),
                Text("Item $position"),
              ],
            ),
            Text(
              "GeeksforGeeks.org was created with a goal "
              "in mind to provide well written, well "
              "thought and well explained solutions for selected"
              " questions. The core team of five super geeks"
              " constituting of technology lovers and computer"
              " science enthusiasts have been constantly working"
              " in this direction.",
            ),
          ],
        ),
      ),
    );
  }
}
