import 'package:flutter/material.dart';

class navbar extends StatefulWidget {
  const navbar({super.key});

  @override
  State<navbar> createState() => _navbarState();
}

class _navbarState extends State<navbar> {
  @override
  Widget build(BuildContext context) {

    //Size Declarition
    final Size size = MediaQuery.of(context).size;

    //Stack for navbar and floating action
    return Stack(
        children: [

          //Navbar Container base shape
          Container(
            width: size.width,
            height: 80,
            child: Stack(
              children: [

                //Nabar custom shape
                CustomPaint(
                  size: Size(size.width, 80),
                  painter: BNBCustomPainter(),
                ), 

                // Floating button for add
                Center(
                  heightFactor: 0.6,
                  child: FloatingActionButton(
                    shape: CircleBorder(),
                    onPressed: (){}, 
                    backgroundColor: Color.fromRGBO(242, 243, 243, 1.0),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(242, 243, 243, 1),
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(36, 40, 40, 0.1),
                            spreadRadius: 0, 
                            blurRadius: 3,
                            offset: Offset(0, 3)
                          )
                        ]
                      ),
                    child: Icon(Icons.add, color: Color.fromRGBO(146, 208, 211, 1.0),),), 
                    elevation: 0.1,
                  ),
                ),

                //Icon button
                Container(
                  width: size.width,
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.home)),
                      IconButton(onPressed: (){}, icon: Icon(Icons.wallet)),
                      Container(width: size.width * 0.2,),
                      IconButton(onPressed: (){}, icon: Icon(Icons.attach_money_rounded)),
                      IconButton(onPressed: (){}, icon: Icon(Icons.query_stats)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
    );
  }
}

//For Custom Shape
class BNBCustomPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size){
    
    //Bottom navbar design
    Paint paint = Paint()..color = const Color.fromRGBO(242, 243, 243, 1.0)..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);
    path.quadraticBezierTo(0, 1, size.width * 0.05, 0);
    path.lineTo(size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
      radius: Radius.circular(9.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.lineTo(size.width * 0.95, 0);
    path.quadraticBezierTo(size.width - 1, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
