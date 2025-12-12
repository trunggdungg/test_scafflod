import 'package:another_flushbar/flushbar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:skeleton_text/skeleton_text.dart';

class slideBarEx extends StatefulWidget {
  const slideBarEx({super.key});

  @override
  State<StatefulWidget> createState() => _slideBarExState();
}

class _slideBarExState extends State<slideBarEx> {
  int _selectedIndex = 0;
  var items = List<int>.generate(20, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text('Slide bar Example'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          slideBarWidget(),
          autoResizeTextEx(),
          skeletonWidgetEx(),
          Center(child: Text('Message Screen')),
          Center(child: Text('Profile Screen')),
        ],
      ),

      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.blue,
        style: TabStyle.react,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.map, title: 'Discovery'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.message, title: 'Message'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
      ),
    );
  }

  Widget slideBarWidget() {
    return Container(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => Slidable(
          startActionPane: ActionPane(
            /// kéo từ trái sang phải
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  setState(() {
                    items.remove(index);
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Archived Item ${items[index]}'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                icon: Icons.archive,
                label: 'Archive',
              ),
              SlidableAction(
                onPressed: (context) {
                  setState(() {
                    items.removeAt(index);
                  });

                  Flushbar(
                    title: "Success!",
                    message: "Item has been deleted.",
                    flushbarPosition: FlushbarPosition.TOP,
                    flushbarStyle: FlushbarStyle.FLOATING,
                    backgroundColor: Colors.green,
                    duration: Duration(seconds: 2),

                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(15),
                    borderRadius: BorderRadius.circular(12),

                    icon: Icon(
                      Icons.check_circle,
                      size: 28,
                      color: Colors.white,
                    ),

                    leftBarIndicatorColor: Colors.white,

                    mainButton: TextButton(
                      onPressed: () {},
                      child: Text(
                        "UNDO",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),

                    forwardAnimationCurve: Curves.fastOutSlowIn,
                    reverseAnimationCurve: Curves.easeOut,

                    animationDuration: Duration(milliseconds: 500),
                  ).show(context);
                },
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),

          endActionPane: ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Share Item ${items[index]}'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                icon: Icons.share,
                label: 'Share',
              ),
            ],
          ),
          child: ListTile(title: Text('Item ${items[index]}')),
        ),
      ),
    );
  }

  Widget autoResizeTextEx() {
    return Container(
      child: Center(
        child: SizedBox(
          width: 200,
          height: 140,
          child: AutoSizeText(
            'This is an example of AutoSizeText widget in Flutter.',
            style: TextStyle(fontSize: 50),
            maxLines: 3,
          ),
        ),
      ),
    );
  }

  Widget skeletonWidgetEx() {
    return Container(
      child: ListView.builder(/// danh sách các mục xương
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(/// khung chứa từng mục
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Colors.white70,
              ),
              child: Container(
                child: Row(/// hàng ngang chứa hình vuông và 2 thanh
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,

                  // SkeletonAnimation method
                  children: <Widget>[
                    SkeletonAnimation(/// hình vuông bên trái
                      child: Container(
                        width: 70.0,
                        height: 70.0,
                        decoration: BoxDecoration(color: Colors.grey[300]),
                      ),
                    ),
                    Column(// cột chứa 2 thanh
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        /// thanh lớn hơn
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                            bottom: 5.0,
                          ),
                          child: SkeletonAnimation(
                            child: Container(
                              height: 15,
                              width: MediaQuery.of(context).size.width * 0.6,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.grey[300],
                              ),
                            ),
                          ),
                        ),
                        Padding(/// thanh bé hơn
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: SkeletonAnimation(
                              child: Container(
                                width: 60,
                                height: 13,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.grey[300],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
