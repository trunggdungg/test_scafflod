class User{
  final int? id;
  final String name;
  final int age;

  User( this.id,{ required this.name, required this.age});

  ///map
  Map<String ,dynamic> toMap(){
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  /// factory constructor
  factory User.fromMap(Map<String , dynamic> map){
    return User(
     map['id'],
     name: map['name'],
     age: map['age'],
    );
  }
}