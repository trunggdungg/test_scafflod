import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class exReturnDataHome extends StatefulWidget {
  const exReturnDataHome({super.key});

  @override
  State<StatefulWidget> createState() => _exReturnDataHomeState();
}

class _exReturnDataHomeState extends State<exReturnDataHome> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Return Data From Screen Example'),
        backgroundColor: Colors.blue,
      ),
      body: IndexedStack(
        index: _selectedIndex,
            children: [
              Center(child: SelectionButton()),
              Center(child: todoScreen(
                tasks: List.generate(
                  10, (i) => Task(
                  'Task $i',
                  'Task Description $i',
                ),
              ),)),
              Center(child: TodoScreenRoute(
                tasks: List.generate(
                  10, (i) => Task(
                  'Task $i',
                  'Task Description $i',
                ),
              ),
              ))
            ],
      ),

      bottomNavigationBar: ConvexAppBar(
          backgroundColor: Colors.blue,
          initialActiveIndex: _selectedIndex,
          activeColor: Colors.white,
          style: TabStyle.react,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.message, title: 'Message'),
            TabItem(icon: Icons.person, title: 'Profile'),
          ]),
    );
  }


  Widget SelectionButton(){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green
      ),
        onPressed: (){
          _navigateAndDisplaySelection(context);
        },
        child: Text('Launch Option Screen')
    );
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectionScreen()),
    );

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$result')));
  }

  Widget SelectionScreen(){
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick an option'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context, 'You selected Option 1');
                  },
                  child: Text('Option 1')),
            ),

            Padding(
              padding: EdgeInsets.all(16.0),
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context, 'You selected Option 2');
                  },
                  child: Text('Option 2')),
            ),
          ],
        ),
      ),
    );
  }

  Widget todoScreen({required List<Task> tasks}){
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text(tasks[index].name),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return DetailScreen(task: tasks[index]);
                }));
              },
            );
          })
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Task task;/// nhận dữ liệu
  DetailScreen({super.key, required this.task});/// đây là constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(task.name),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(task.description),
      ),
    );
  }
}

class TodoScreenRoute extends StatelessWidget {
  final List<Task> tasks;
  TodoScreenRoute({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        backgroundColor: Colors.white70,
        foregroundColor: Colors.green,
      ),

      body: ListView.builder(
        itemCount: tasks.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text(tasks[index].name),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder:(context) => DetailScreenRoute(),
                       settings: RouteSettings(
                          arguments: tasks[index],
                       ),
                    )
                );
              },
            );
          }),
    );
  }
}


class DetailScreenRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final Task task = ModalRoute.of(context)!.settings.arguments as Task;
    // TODO: implement build
   return Scaffold(
     appBar:AppBar(
       title: Text(task.name),
       backgroundColor: Colors.green,
     ),

     body: Padding(
         padding: EdgeInsets.all(16.0),
       child: Text(task.description),
     ),
   );
  }

}


class Task {
  String name;
  String description;

  Task(this.name, this.description);
}