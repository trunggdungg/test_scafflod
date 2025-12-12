import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class myExpansionTitleCard extends StatefulWidget {
  const myExpansionTitleCard({super.key});

  @override
  State<StatefulWidget> createState() => _myExpansionTitleCardState();
}

class _myExpansionTitleCardState extends State<myExpansionTitleCard> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          children: [
            DrawerHeader(
                child: Text("Xin chào")),
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
        title: Text('Expansion Tile Card Example'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),

      body: IndexedStack(
        index: _selectedIndex,
        children: [
          expansionTileCardEx(),
          tabDefaultController(),
          listHorizontal(),
          chartExample(),
        ],

      ),

        bottomNavigationBar: ConvexAppBar(
          style: TabStyle.react,/// kiểu hiệu ứng khi chọn
          backgroundColor: Colors.blue,
          activeColor: Colors.white,
          color: Colors.white70,  // màu item chưa chọn
          items: [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.person, title: 'Person'),
            TabItem(icon: Icons.hail, title: 'Hail'),
            TabItem(icon: Icons.show_chart, title: 'Chart'),
          ],
          initialActiveIndex: _selectedIndex,
          onTap: (int i) {
            setState(() {
              _selectedIndex = i;
            });
          },
        )

    );
  }
}

Widget expansionTileCardEx(){
  return ListView(
    padding: EdgeInsets.all(12),
    children: [
      ExpansionTileCard(
        title: Text("Tap to Expand"),
        subtitle: Text("Example ExpansionTileCard"),
        children: [
          Image.network('https://media.geeksforgeeks.org/auth-dashboard-uploads/gfgFooterLogo.png'),
          ListTile(title: Text("Child item 2")),
          ListTile(title: Text("Xin chào mọi người!"),)
        ],
      ),
    ],
  );
}


Widget tabDefaultController() {
  return DefaultTabController(
    length: 5,
    child: Column(
      children: [
        Container(
          color: Colors.green,
          child: TabBar(
            indicatorColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            labelColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.music_note)),
              Tab(icon: Icon(Icons.music_video)),
              Tab(icon: Icon(Icons.camera_alt)),
              Tab(icon: Icon(Icons.grade)),
              Tab(icon: Icon(Icons.email)),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            children: [
              Center(child: Text('Music Note Tab')),
              Center(child: Text('Music Video Tab')),
              Center(child: Text('Camera Tab')),
              Center(child: Text('Grade Tab')),
              Center(child: Text('Email Tab')),
            ],
          ),
        ),
      ],
    ),
  );
}


Widget listHorizontal(){
  return Container(
    child: ListView(
      scrollDirection: Axis.vertical,
      children: [
        Container(
        width: 140,
        height: 140,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://4kwallpapers.com/images/walls/thumbs_2t/13495.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        width: 140,
        height: 140,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://4kwallpapers.com/images/walls/thumbs_2t/13495.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        width: 140,
        height: 140,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://4kwallpapers.com/images/walls/thumbs_2t/13495.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        width: 140,
        height: 140,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://4kwallpapers.com/images/walls/thumbs_2t/13495.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      )
    ],),

  );
}

Widget chartExample(){
  return Center(
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            title: ChartTitle(text: 'Monthly Covid-19 Cases'),

            legend: Legend(isVisible: true),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <CartesianSeries<_Infections, String>>[
              LineSeries<_Infections, String>(/// biểu đồ đường
                  dataSource: <_Infections>[
                    _Infections('Jan', 35000),
                    _Infections('Feb', 28000),
                    _Infections('Mar', 34000),
                    _Infections('Apr', 32000),
                    _Infections('May', 40000),
                    _Infections('Jun', 60000)
                  ],
                  xValueMapper: (_Infections victims, _) => victims.year,
                  yValueMapper: (_Infections victims, _) => victims.victims,
                  // Enable data label
                  dataLabelSettings: DataLabelSettings(isVisible: true))
            ],
          ),
  );
}

class _Infections {
  _Infections(this.year, this.victims);

  final String year;
  final double victims;
}