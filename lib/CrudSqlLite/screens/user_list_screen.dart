import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:test_scafflod/CrudSqlLite/screens/user_detail_screen.dart';
import 'package:test_scafflod/CrudSqlLite/screens/user_form_screen.dart';
import '../models/user.dart';
import '../db/user_database_helper.dart';

class UserListScreen2 extends StatefulWidget {
  const UserListScreen2({super.key});

  @override
  State<UserListScreen2> createState() => _UserListScreen2State();
}

class _UserListScreen2State extends State<UserListScreen2> {
  late Future<List<User>> _futureUsers;

  @override
  void initState() {
    super.initState();
    _futureUsers = _initData();
  }

  Future<List<User>> _initData() async {
    await UserDatabaseHelper2.instance.insertDummyUsers();
    return await UserDatabaseHelper2.instance.getUsers();
  }


  Future<void> _reload() async {
    setState(() {
      _futureUsers = UserDatabaseHelper2.instance.getUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List Screen'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: _reload,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder<List<User>>(
        future: _futureUsers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Lỗi: ${snapshot.error}'));
          }

          final users = snapshot.data ?? [];
          if (users.isEmpty) {
            return const Center(child: Text('Chưa có user nào'));
          }

          return ListView.separated(
            itemCount: users.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (_, index) {
              final u = users[index];

              return Slidable(
                key: ValueKey(u.id),

                // Vuốt từ TRÁI → PHẢI (Edit)
                startActionPane: ActionPane(
                  motion: const DrawerMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (_) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>  UserAddScreen2(user: u,), // 👈 ADD
                          ),
                        ).then((_) => _reload());
                      },
                      backgroundColor: Colors.blue,
                      icon: Icons.edit,
                      label: 'Edit',
                    ),
                  ],
                ),

                // Vuốt từ PHẢI → TRÁI (Delete)
                endActionPane: ActionPane(
                  motion: const DrawerMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (_) async {
                        await UserDatabaseHelper2.instance.deleteUser(u.id!);
                        _reload();
                      },
                      backgroundColor: Colors.red,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                  ],
                ),

                child: ListTile(
                  title: Text(u.name),
                  subtitle: Text('Age: ${u.age}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => UserDetailScreen2(user: u),
                      ),
                    ).then((_) => _reload());
                  },
                ),
              );
            },
          );

        },
      ),


      floatingActionButton: FloatingActionButton(
          onPressed: (){
              Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context) => UserAddScreen2()
              )
              ).then((_) => _reload());
          },
        child: Icon(Icons.add),
      ),
    );
  }
}
