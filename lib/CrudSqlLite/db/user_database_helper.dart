import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/user.dart';

/// ===============================
/// DATABASE HELPER
/// Lớp chịu trách nhiệm quản lý SQLite
/// ===============================
class UserDatabaseHelper2 {

  /// ===============================
  /// SINGLETON
  /// Đảm bảo chỉ có 1 instance duy nhất
  /// ===============================
  static final UserDatabaseHelper2 _instance2 =
  UserDatabaseHelper2._internal();

  static UserDatabaseHelper2 get instance => _instance2;

  UserDatabaseHelper2._internal(); // constructor private

  /// ===============================
  /// DATABASE OBJECT
  /// Biến giữ kết nối database
  /// ===============================
  static Database? _database;

  /// ===============================
  /// GET DATABASE
  /// Kiểm tra DB đã mở chưa, nếu chưa thì init
  /// ===============================
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  /// ===============================
  /// INIT DATABASE
  /// openDatabase + đường dẫn file .db
  /// ===============================
  Future<Database> _initDatabase() async {
    String dbPath = await getDatabasesPath();
    final String path = join(dbPath, 'user.db');

    return await openDatabase( // 🔹 openDatabase
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  /// ===============================
  /// CREATE TABLE
  /// Chạy lần đầu khi DB chưa tồn tại
  /// ===============================
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        age INTEGER
      )
    ''');
  }

  /// ===============================
  /// INSERT DATA
  /// ===============================
  Future<int> insertUser(User user) async {
    final db = await database;
    return await db.insert('users', user.toMap());
  }

  /// ===============================
  /// DUMMY DATA
  /// ===============================
  static final List<User> dummyUsers2 = [
    User(null, name: 'Nguyen Van A', age: 25),
    User(null, name: 'Tran Thi B', age: 30),
    User(null, name: 'Le Van C', age: 28),
  ];

  /// ===============================
  /// INSERT DUMMY DATA (TEST)
  /// ===============================
  Future<void> insertDummyUsers() async {
    final users = await getUsers();
    if (users.isNotEmpty) return;

    for (final user in dummyUsers2) {
      await insertUser(user);
    }
  }

  /// ===============================
  /// HÀM ĐỌC DỮ LIỆU
  /// ===============================
  Future<List<User>> getUsers() async {
    final db = await database;

    /// 🔹 db.query()
    final List<Map<String, dynamic>> maps =
    await db.query('users');

    /// 🔹 convert Map → Object
    return maps
        .map((e) => User.fromMap(e))
        .toList();
  }


  Future<int> updateUser(User user) async {
    final db = await database;
    return await db.update(
      'users',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  Future<int> deleteUser(int id) async {
    final db = await database;
    return await db.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
