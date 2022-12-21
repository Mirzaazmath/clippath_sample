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
    // here we are moving our point to certain place
    // by doing that we will assign the new value to its pointg
   path.moveTo(size.width/2, 0);
   path.lineTo(0, size.height);
   path.lineTo(size.height, size.width);
   path.close();

    return path;


  }
// make sure you return true to should reclip otherwise it throws an error
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {

   return true;
  }
  
}

