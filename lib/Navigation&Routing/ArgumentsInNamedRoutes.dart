import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class ExArgumentsInNamedRoutes extends StatefulWidget {
  const ExArgumentsInNamedRoutes({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExArgumentsInNamedRoutesState();
  }
}

class _ExArgumentsInNamedRoutesState extends State<ExArgumentsInNamedRoutes> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Arguments in Named Routes'),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          Center(child: homeNavigatorFlutter()),
          Center(child: Text('')),
          Center(child: Text('')),
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

  Widget homeNavigatorFlutter() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white70,
            ),
            onPressed: () {
              Navigator.pushNamed(context, PassArgumentsScreen.routeName1,
              arguments: Arguments(/// Arguments này là class Arguments bên dưới
                'Accepting Arguments Screen',
                'Extracted in the onGrenerateRoute function.',
              ));
            },
            child: Text('Click me Arguments'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white70,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/third');
            },
            child: Text('Tap me Arguments'),
          ),
        ],
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page Arguments'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text('Back to home')),
      ),
    );
  }
}


class ThirdRoute extends StatelessWidget {
  const ThirdRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Page Arguments'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text('Tap me page')),
      ),
    );
  }
}


class PassArgumentsScreen extends StatelessWidget {
  static const routeName1 = '/passArguments';

  final String title;
  final String message;

  const PassArgumentsScreen({
    super.key,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}

// Updated Arguments class with matching field names.
class Arguments {
  final String title;
  final String message;

  Arguments(this.title, this.message);
}

///Khi bạn gọi Navigator.pushNamed(),  Flutter tự động tạo một RouteSettings
///chứa name (tên route) và arguments (dữ liệu kèm theo).
///RouteSettings này được chuyển vào hàm onGenerateRoute.
///Tại đây, Flutter so sánh settings.name với các routeName đã định nghĩa để xác định màn hình nào cần được tạo.
///Khi tên route khớp, onGenerateRoute sẽ lấy dữ liệu từ settings.arguments, tạo MaterialPageRoute và
///truyền dữ liệu vào constructor của màn hình tương ứng để hiển thị.