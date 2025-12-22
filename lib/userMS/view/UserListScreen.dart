import 'package:flutter/material.dart';
import 'package:test_scafflod/userMS/db/UserDatabaseHelper.dart';
import '../model/User.dart';
import 'UserDetailScreen.dart';
import 'UserFormScreen.dart'; // màn hình thêm / sửa user

class UserListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  late Future<List<User>> _futureUserList;

  @override
  void initState() {
    super.initState();
    _futureUserList = UserDatabaseHelper.instance.getUsers();
  }

  void _loadUserList() {
    setState(() {
      _futureUserList = UserDatabaseHelper.instance.getUsers();
    });
  }

  Future<void> _deleteUser(int userId) async {
    await UserDatabaseHelper.instance.deleteUser(userId);
    _loadUserList();
  }

  void _confirmDelete(User user) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Xoá người dùng"),
        content: Text("Bạn có chắc muốn xoá '${user.name}' không?"),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Hủy")),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              await _deleteUser(user.id!);
            },
            child: Text("Xoá", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Danh sách người dùng"),
        actions: [
          IconButton(onPressed: _loadUserList, icon: Icon(Icons.refresh))
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => UserFormScreen()),
          );
          _loadUserList();
        },
      ),

      body: FutureBuilder<List<User>>(
        future: _futureUserList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Lỗi: ${snapshot.error}"));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("Không có người dùng nào"));
          }

          final users = snapshot.data!;

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];

              return Dismissible(
                key: ValueKey(user.id),
                direction: DismissDirection.endToStart,/// chỉ cho phép vuốt từ phải sang trái để xoá
                background: Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 20),
                  color: Colors.red,
                  child: Icon(Icons.delete, color: Colors.white),
                ),

                confirmDismiss: (_) async {
                  _confirmDelete(user);
                  return false;
                },

                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: user.avatar != null
                        ? NetworkImage(user.avatar!)
                        : null,
                    child: user.avatar == null
                        ? Icon(Icons.person)
                        : null,
                  ),
                  title: Text(user.name),
                  subtitle: Text(user.email),

                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => UserDetailScreen(user: user),
                      ),
                    );
                    _loadUserList();
                  },

                  trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => UserFormScreen(user: user),
                        ),
                      );
                      _loadUserList();
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
