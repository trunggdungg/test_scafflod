import 'package:flutter/material.dart';
import 'package:test_scafflod/MyScaffold.dart';
import 'package:test_scafflod/testExtends.dart';
import 'package:test_scafflod/userMS/view/UserListScreen.dart';

import 'AnimationRouteTransition.dart';
import 'CarouselStaggeredGridTileAndProgress.dart';
import 'DateTimePicker.dart';
import 'ExFormFieldValidate.dart';
import 'ExampleCard.dart';
import 'ExampleTest2.dart';
import 'ExpansionTileCardExample.dart';
import 'GestureDetector.dart';
import 'HeroAnimation.dart';
import 'HingeAnimation.dart';
import 'ImagesPicker.dart';
import 'MyFormBasic.dart';
import 'MyTextField.dart';
import 'MyTextField2.dart';
import 'Navigation&Routing/ArgumentsInNamedRoutes.dart';
import 'Navigation&Routing/RoutesAndNavigator.dart';
import 'SlideBar.dart';
import 'TextFormFieldValidate.dart';
import 'Video.dart';
import 'lottieAnimation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),

      home: ExArgumentsInNamedRoutes(),
      routes: {
        '/second': (context) {
          return SecondRoute();
        },
        '/third': (context) => ThirdRoute(),
      },

      onGenerateRoute: (settings) {
        if (settings.name == PassArgumentsScreen.routeName1) {
          print('name: ${settings.name}');
          final agrd = settings.arguments as Arguments;
          return MaterialPageRoute(
            builder: (context) {
              return PassArgumentsScreen(
                title: agrd.title,
                message: agrd.message,
              );
            },
          );
        }
        if(settings.name =='/third'){
            return MaterialPageRoute(
                builder: (context) => ThirdRoute()
            );
        }
        assert (false, 'Need to implement ${settings.name}');
        return null;
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
