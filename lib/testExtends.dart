import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ParentA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("A")),
      body: Center(
        child: ChildB(), // 👈 Gọi widget con
      ),
    );
  }
}

class ChildB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.white, Colors.lightBlueAccent]
              )
          ),
          // color: Colors.blue,
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Text("Tôi là widget B",
                style: GoogleFonts.bungeeSpice(),
              ),

              Text("Test Google Fonts Custom", style: TextStyle(fontFamily: 'CustomFont',fontSize: 24),
              ),

              SizedBox(height: 20,),

              Container(
                color: Colors.yellow,
                child: RichText(

                  textAlign: TextAlign.center,
                    text: TextSpan(text: "Xin chào",
                    style: TextStyle(color: Colors.red,fontSize: 24),
                      children: [
                        TextSpan(
                          text: " Flutter",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(

                          text: " World!",
                          style: TextStyle(

                            color: Colors.green,
                            fontSize: 24,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ]
                    ),

                ),
              ),

              SizedBox(height: 16,),

              Row(
                children: [
                  Icon(Icons.star, color: Colors.orange, size: 32),
                  Icon(Icons.favorite, color: Colors.red, size: 32),
                  Icon(Icons.thumb_up, color: Colors.blue, size: 32),
                  //widget images
                  Image(
                    image: AssetImage('assets/images/tanjiro-kamado-6082x5416-23027.jpg'),
                    width: 150,
                    height: 150,
                  ),
                  Image(
                    image: NetworkImage(
                        'https://cdn2.fptshop.com.vn/unsafe/1920x0/filters:format(webp):quality(75)/hinh_nen_tanjiro_23_1414d32dfb.jpg'),
                    width: 100,
                    height: 100,
                  )

                ],
              )
            ],
          ),
        ),

    );

  }
}
