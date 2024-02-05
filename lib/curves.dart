import 'package:flutter/material.dart';

class Curves1 extends StatelessWidget {
  Curves1({super.key});
  double scale = 400/500;
  late var points = [
    //const Offset(100, 300),
     Offset(10*scale, 280*scale),

     Offset(15*scale, 250*scale),
     Offset(30*scale, 230*scale),
     Offset(200*scale, 10*scale),
     Offset(460*scale, 150*scale),
     Offset(400*scale, 475*scale),
    //const Offset(275, 500),
     Offset(170*scale, 470*scale),
     Offset(10*scale, 330*scale),

     Offset(10*scale, 280*scale),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 500,
          height: 500,
          child: CustomPaint(
            painter: CurveCustomPainter(points),
          ),
        ),
      ),
    );
  }
}
class CurveCustomPainter extends CustomPainter{
  var points=[];
  CurveCustomPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color =
        Colors.blueAccent..style;



    // for(var i =0; i < points.length-1; i++){
    //   var currentPoint = points[i];
    //   var nextPoint = points[i+1];
    //   canvas.drawLine(currentPoint, nextPoint, paint);
    // }

    // for (var p in points){
    //   canvas.drawCircle(p, 15, paint..color =Colors.black);
    // }
    var path = Path();

    path.moveTo(points[0].dx, points[0].dy);

    for(var i = 0;i<points.length-2;i++){
      var xc = (points[i].dx + points[i+1].dx) / 2;
      var yc = (points[i].dy + points[i+1].dy) / 2;
      
      path.quadraticBezierTo(points[i].dx, points[i].dy, xc, yc,);

    }
    path.quadraticBezierTo(
      points[points.length-2].dx,
      points[points.length-2].dy,
      points[points.length-1].dx,
      points[points.length-1].dy,
    );

    canvas.drawPath(path, paint..color = const Color(0xff0046a5));


    //canvas.drawCircle(Offset(100, 300), 15, paint..color = Colors.black);
    //canvas.drawCircle(Offset(400, 300), 15, paint..color = Colors.black);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
  
  
}