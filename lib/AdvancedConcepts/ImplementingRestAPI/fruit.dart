class Fruit {
  final int id;
  final String title;
  final String imgUrl;
  final int quantity;

  Fruit({
    required this.id,
    required this.title,
    required this.imgUrl,
    required this.quantity,
  });
/// chuyển đổi từ json sang object
  factory Fruit.fromMap(Map<String, dynamic> json) {
    return Fruit(
      id: json['id'],
      title: json['title'],
      imgUrl: json['imgUrl'],
      quantity: json['quantity'],
    );
  }


}
