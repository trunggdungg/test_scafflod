import '../model/User.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class UserDatabaseHelper {
  static final UserDatabaseHelper instance = UserDatabaseHelper._init();

  static Database? _database;

  UserDatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('db_user.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
      onUpgrade: (db, oldVersion, newVersion) async {
        // Xóa bảng cũ
        await db.execute("DROP TABLE IF EXISTS users");

        // Tạo lại bảng mới
        await _createDB(db, newVersion);
      },
    );

  }

  // ------ DUMMY DATA NÊN ĐỂ STATIC (KHÔNG TẠO MỖI LẦN INSTANCE) ------
  static final List<User> dummyUsers = [
    User(
      id: 1,
      name: "Nguyễn Văn A",
      email: "vana@example.com",
      phone: "0987654321",
      avatar: null,
      dateOfBirth: DateTime(2000, 5, 10),
    ),
    User(
      id: 2,
      name: "Trần Thị B",
      email: "thib@example.com",
      phone: "0912345678",
      avatar: null,
      dateOfBirth: DateTime(1999, 3, 22),
    ),
    User(
      id: 3,
      name: "John Smith",
      email: "johnsmith@example.com",
      phone: "0909090909",
      avatar: "https://i.pravatar.cc/150?img=1",
      dateOfBirth: DateTime(1995, 12, 1),
    ),
    User(
      id: 4,
      name: "Alice Johnson",
      email: "alicej@example.com",
      phone: "0933557799",
      avatar: "https://i.pravatar.cc/150?img=2",
      dateOfBirth: DateTime(1998, 8, 15),
    ),
  ];

  // ------ Tạo bảng + thêm dữ liệu mẫu ------
  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT NOT NULL,
        phone TEXT NOT NULL,
        avatar TEXT,
        dateOfBirth TEXT NOT NULL
      )
    ''');

    // Insert dummy data vào DB
    for (var user in dummyUsers) {
      await db.insert("users", user.toMap());
    }
  }

  // ------ CRUD ------

  Future<int> insertUser(User user) async {
    final db = await instance.database;
    return db.insert("users", user.toMap());
  }

  Future<List<User>> getUsers() async {
    final db = await instance.database;
    final result = await db.query("users");

    return result.map((map) => User.fromMap(map)).toList();
  }

  Future<User?> getUser(int id) async {
    final db = await instance.database;

    final result = await db.query(
      "users",
      where: "id = ?",
      whereArgs: [id],
    );

    if (result.isNotEmpty) {
      return User.fromMap(result.first);
    }
    return null;
  }

  Future<int> updateUser(User user) async {
    final db = await instance.database;

    return await db.update(
      "users",
      user.toMap(),
      where: "id = ?",
      whereArgs: [user.id],
    );
  }

  Future<int> deleteUser(int id) async {
    final db = await instance.database;

    return await db.delete(
      "users",
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
