class User {
  // Thuộc tính của lớp User,
  // trên này viết ?( là có thể null) thì dưới constructor phải để required
  int? id;
  String name;
  String email;
  String phone;
  String? avatar;
  DateTime dateOfBirth;
// Constructor phải để required đối với các thuộc tính không thể null trên User
  User({
      this.id,
    required  this.name,
    required  this.email,
    required  this.phone,
      this.avatar,
    required  this.dateOfBirth});

  // theo dạng cũ không có required thì là dạng tham số theo thứ tự
  // User(this.id, this.name, this.email, this.phone, this.avatar, this.dateOfBirth);
  // dạng này dưới factory không gán được dạng 'id: map['id']'
  // mà phải theo thứ tự 'map['id'], map['name'],...'
  // Chuyển đổi đối tượng thành Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'avatar': avatar,
      'dateOfBirth': dateOfBirth.toIso8601String(),
    };
  }

  //Tao đối tượng từ Map( gọi ham khởi tạo từ Map)
  factory User.fromMap(Map<String, dynamic> map) {
  return User(
    id: map['id'],
    name: map['name'],
    email: map['email'],
    phone: map['phone'],
    avatar: map['avatar'],
    dateOfBirth: DateTime.parse(map['dateOfBirth'])
  );
  }

  // copyWith để tạo bản sao của đối tượng với các thuộc tính có thể thay đổi
  User copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? avatar,
    DateTime? dateOfBirth,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      avatar: avatar ?? this.avatar,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    );
  }


  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, phone: $phone, avatar: $avatar, dateOfBirth: $dateOfBirth}';
  }


}