import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExampleUi extends StatefulWidget {
  const ExampleUi({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExampleUiState();
  }
}

class _ExampleUiState extends State<ExampleUi> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example UI'),
        backgroundColor: Colors.green,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          Center(child: helperWidget()),
          Center(child: cardWidget()),
          Center(child: strawberryWidget()),
        ],
      ),


        bottomNavigationBar: ConvexAppBar(
          style: TabStyle.react,
            backgroundColor: Colors.green,
            activeColor: Colors.white,
            initialActiveIndex: _selectedIndex,
            onTap: (int index){
              setState(() {
                _selectedIndex = index;
              });
            },
            items: [
              TabItem(icon: Icons.home, title: 'Home'),
              TabItem(icon: Icons.message, title: 'Messages'),
              TabItem(icon: Icons.person, title: 'Profile'),
            ]),
    );
  }

  Widget _boxWidget( String title, String text){
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: BoxBorder.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700),),
          SizedBox(height: 16,),
          Text(text),
          Align(alignment: Alignment.centerRight,
            child: ElevatedButton(onPressed: (){

            }, child: Text('Free')),
          ),
        ],
      ),
    );
  }


  Widget _boxCard( String title, String text, String price, bool isSelected){
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: BoxBorder.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
        color: isSelected ? Colors.yellow : Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700),),
              SizedBox(height: 16,),
              Text(text),
            ],
          ),
          Text(price, style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600, color: isSelected ? Colors.red : Colors.black),),
        ],
      ),
    );
  }

  Widget helperWidget() {
    return  Padding(padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Chào Bạn', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 26),),
            SizedBox(height: 16,),
            Text('Hãy chọn tính năng miễn phí mà các bạn muốn trải nghiệm trong ứng dụng này nhé!', style: TextStyle(fontSize: 16),),
            SizedBox(height: 16,),
            _boxWidget('Canh cổng tự động', 'Giúp bạn canh cổng tự động mà không cần phải ngồi canh máy tính suốt cả ngày. Chỉ cần bật tính năng này lên, hệ thống sẽ tự động giúp bạn canh cổng một cách hiệu quả nhất.'),
            SizedBox(height: 16,),
            _boxWidget('Nhắc nhở lịch học', 'Giúp bạn không bao giờ quên lịch học quan trọng. Hệ thống sẽ gửi thông báo nhắc nhở bạn trước mỗi buổi học để bạn có thể chuẩn bị tốt nhất.'),
          ],
        ),
    );
  }

  Widget cardWidget(){
    return Container(
      decoration: BoxDecoration(
        border: BoxBorder.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Chọn gói nộp hồ sơ tự động'),
            SizedBox(height: 16,),
            _boxCard('1 phút/SMS','text', 'Free', true),
            SizedBox(height: 16,),
            _boxCard('30 phút/SMS','text', '10.000 VND', false),
            SizedBox(height: 16,),
          ],
        ),
      ),
      
    );
  }


  Widget strawberryWidget(){
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink[100]!, Colors.yellow[100]!],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Expanded(

                child: Padding(padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text('Strawberry Pavlova', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                      SizedBox(height: 16,),
                      Text('Pavlova is a meringue-based dessert named after the Russian ballerina Anna Pavlova. Pavlova features a crisp crust and soft, light inside, topped with fruit and whipped cream.'),
      
                      SizedBox(height: 20,),
      
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ...List.generate(5, (i) => Icon(Icons.star, color: Colors.red, size: 20,)),
                                SizedBox(width: 16,),
                                Text('170 Reviews', style: TextStyle(fontSize: 16),),
                              ],
                            ),
                            SizedBox(height: 16,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _timeInfo(Icons.restaurant, 'PREP', '25 min', Colors.green),
                                _timeInfo(Icons.timer, 'COOK', '1 hr', Colors.orange),
                                _timeInfo(Icons.person, 'FEEDS', '4-6', Colors.purple),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
            ),
            SizedBox(width: 20,),
            Expanded(

                child: Container(
                  height: 350,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Icon(Icons.cake, size: 80,),
                  ),
                ),
            )
          ],
        )
      ),
    );
  }



  Widget _timeInfo( IconData icon, String label, String value, Color color) {
    return Column(
        children: [
          Icon(icon, color: color,),
          SizedBox(height: 4,),
          Text(label, style: TextStyle(fontSize: 16, ),),
          SizedBox(height: 4,),
          Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,),),

        ],
    );
  }
}