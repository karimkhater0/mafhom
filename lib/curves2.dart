import 'package:flutter/material.dart';



//Add this CustomPaint widget to the Widget Tree


//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
@override
void paint(Canvas canvas, Size size) {

Path path_0 = Path();
path_0.moveTo(size.width*0.5771525,size.height*0.000009884133);
path_0.cubicTo(size.width*0.7496950,size.height*0.001407427,size.width*0.8632234,size.height*0.1431157,size.width*0.9488652,size.height*0.2673453);
path_0.cubicTo(size.width*1.016897,size.height*0.3660367,size.width*1.004021,size.height*0.4777233,size.width*0.9839965,size.height*0.5901833);
path_0.cubicTo(size.width*0.9606454,size.height*0.7213200,size.width*0.9619291,size.height*0.8728533,size.width*0.8281312,size.height*0.9453800);
path_0.cubicTo(size.width*0.6804326,size.height*1.025440,size.width*0.4844894,size.height*1.009990,size.width*0.3250018,size.height*0.9473900);
path_0.cubicTo(size.width*0.1641461,size.height*0.8842533,size.width*0.03095408,size.height*0.7675700,size.width*0.003583511,size.height*0.6217433);
path_0.cubicTo(size.width*-0.02206188,size.height*0.4851067,size.width*0.09490071,size.height*0.3710767,size.width*0.1962195,size.height*0.2612490);
path_0.cubicTo(size.width*0.3015532,size.height*0.1470700,size.width*0.4038050,size.height*-0.001394143,size.width*0.5771525,size.height*0.000009884133);
path_0.close();

Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
paint_0_fill.color = Color(0xff4D689D).withOpacity(1.0);
canvas.drawPath(path_0,paint_0_fill);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
return true;
}
}