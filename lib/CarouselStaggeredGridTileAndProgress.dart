import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:path/path.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<StatefulWidget> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // Drawer
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
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
        title: Text('Carousel Example'),
        actions: [
          IconButton(
              onPressed: (){

              },
              icon: Icon(Icons.search)
          ),
          IconButton(
              onPressed: (){

              },
              icon: Icon(Icons.more_vert)
          ),
        ],
      ),
/// dùng IndexedStack
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          carouSelWidget(),// carousel slider
          StaggeredGridTileEx(),// Staggered Grid Tile
          proGress(),// Progress Indicator
          showDialogEx(context: context),
        ],
      ),

      floatingActionButton: FloatingActionButton(
          onPressed: (){

          },
      child: Icon(Icons.add),),


      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,/// dùng để hiển thị nhiều hơn 3 tab
          currentIndex: _selectedIndex,
          onTap: (int index){
            setState(() {
              _selectedIndex = index;
            });
          },
        backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),label: 'Profile'),

            BottomNavigationBarItem(
                icon: Icon(Icons.refresh),label: 'Progress'),
            BottomNavigationBarItem(
                icon: Icon(Icons.show_chart),label: 'Dialog'),
          ]),
    );
  }
}


Widget carouSelWidget(){
  return ListView(
    children: [
      SizedBox(height: 16,),
      CarouselSlider(
          items:[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: NetworkImage("https://picsum.photos/400/200"),
                fit: BoxFit.cover,
              )
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage("https://picsum.photos/400/200"),
                  fit: BoxFit.cover,
                )
            ),
          ),
        ],
        options: CarouselOptions(
          height: 180.0,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          viewportFraction: 0.8,
        ),
      ),
    ],
  );
}

Widget StaggeredGridTileEx(){
  return SingleChildScrollView(
    child: Container(
      child: StaggeredGrid.count(
          crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: [
          StaggeredGridTile.count(
            crossAxisCellCount: 1,// chiếm 1 cột
            mainAxisCellCount: 2, // chia thành 2 hàng
            child: BackGroundTile(backgroundColor: Colors.red, icondata: Icons.home),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child:
            BackGroundTile(backgroundColor: Colors.orange, icondata: Icons.ac_unit),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 2,
            child:
            BackGroundTile(backgroundColor: Colors.pink, icondata: Icons.landscape),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child:
            BackGroundTile(backgroundColor: Colors.green, icondata: Icons.portrait),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 4,
            mainAxisCellCount: 2,
            child: BackGroundTile(
                backgroundColor: Colors.deepPurpleAccent, icondata: Icons.music_note),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 4,
            mainAxisCellCount: 2,
            child: BackGroundTile(
                backgroundColor: Colors.blue, icondata: Icons.access_alarms),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 4,
            mainAxisCellCount: 2,
            child: BackGroundTile(
                backgroundColor: Colors.indigo, icondata: Icons.satellite_outlined),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 4,
            mainAxisCellCount: 2,
            child: BackGroundTile(
                backgroundColor: Colors.deepPurpleAccent, icondata: Icons.music_note),
          ),
      StaggeredGridTile.count(
        crossAxisCellCount: 4,
        mainAxisCellCount: 2,
        child: Card(

          color: Colors.deepPurpleAccent,
          child: const Icon(Icons.music_note, color: Colors.white),
        ),
      )

      ],
      ),
    ),
  );
}

class BackGroundTile extends StatelessWidget {
  final Color backgroundColor;
  final IconData icondata;

  BackGroundTile({required this.backgroundColor, required this.icondata});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: Icon(icondata, color: Colors.white),
    );
  }
}



Widget proGress(){
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(
          backgroundColor: Colors.redAccent,
          valueColor: AlwaysStoppedAnimation(Colors.green),
          // strokeWidth: 10,
        ),// thanh tiến trình tròn
        SizedBox(height: 20),
        LinearProgressIndicator(	backgroundColor: Colors.redAccent,
          valueColor: AlwaysStoppedAnimation(Colors.green),
          // minHeight: 20,
        ),// thanh tiến trình ngang
        SizedBox(height: 20),
        RefreshProgressIndicator(),// thanh tiến trình làm mới
      ],
    ),
  );
}


Widget showDialogEx({required BuildContext context}){
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: (){
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Tiêu đề Dialog'),
                    content: Text('Nội dung của Dialog'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Đóng'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('Nhấn để hiển thị Dialog',style: TextStyle(color: Colors.black),))
      ],
    ),
  );
}