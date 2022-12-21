import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // here we are using the clippath to crete our own custom design
        child: ClipPath(
          // here we calling the customDesgin class it will force the child widget to take the form
          clipper: CustomDesgin(),
          child: Container(
            height: 250,
            width: 250,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
// this is a custom class that is extends from CustomClipper with the path
class CustomDesgin extends CustomClipper<Path>{
  @override
  // here we are desigining the cutom shape
  Path getClip(Size size) {

    Path path=Path();
    // path ,lineTo is used to create the stright line from x to y
    path.lineTo(0, 0);
    path.lineTo(0,size.height);
    path.lineTo(size.height, size.width);
    path.lineTo(size.width, 0);

    return path;


  }
// make sure you return true to should reclip otherwise it throws an error
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {

   return true;
  }
  
}

