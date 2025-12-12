import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardExample extends StatefulWidget {
  const CardExample({super.key});

  @override
  State<StatefulWidget> createState() => _CardExampleState();
}

class _CardExampleState extends State<CardExample> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Drawer
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            DrawerHeader(child: Text("Xin chào")),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Card Example'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),

          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),

      body: IndexedStack(
        index: _selectedIndex,
        children: [
          cardItem(),
          Center(child: Text('Profile Screen')),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: (int i) {
          setState(() {
            _selectedIndex = i;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

Widget cardItem() {
  return Center(
    child: Card(
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                'https://static.vecteezy.com/system/resources/thumbnails/057/068/323/small/single-fresh-red-strawberry-on-table-green-background-food-fruit-sweet-macro-juicy-plant-image-photo.jpg',
              ),
            ),
            Text(
              'Nguyễn Văn A',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            RichText(
              text: TextSpan(style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black,),
                children: [
                  TextSpan(text: 'Lập trình viên'),
                  TextSpan(text: ' Flutter', style: const TextStyle(color: Colors.red,),
                    children: [
                      const TextSpan(text: ' với hơn', style: TextStyle(color: Colors.black),),
                      const TextSpan(text: ' 3 năm ', style: TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.w500,),),
                      const TextSpan(text: 'kinh nghiệm', style: TextStyle(color: Colors.black),),

                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 8,),
            Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle, color: Colors.white,),
                SizedBox(width: 8,),
                Text("Đang hoạt động")
              ],
            )
          ],
        ),
      ),
    ),
  );
}
