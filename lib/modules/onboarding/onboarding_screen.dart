import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafhom/shared/cubit/cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../models/onboarding_model.dart';
import '../../shared/components.dart';
import '../../shared/constants.dart';
import '../../shared/cubit/states.dart';



class OnBoardingScreen extends StatelessWidget  {
  List<BoardingModel> boarding=[
    BoardingModel(
      image: 'assets/images/onboarding/1.png',
      title: 'Say Hi To Everyone',
    ),
    BoardingModel(
      image: 'assets/images/onboarding/2.png',
      title: 'Talk With Love',
    ),
    BoardingModel(
      image: 'assets/images/onboarding/3.png',
      title: 'Understand Everyone',
    ),

  ];
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

  var boardController = PageController();


  @override
  Widget build(BuildContext context) {
    //var cubit = AppCubit.get(context);

    return BlocProvider(
      create: (BuildContext context) =>AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state){},
        builder: (context, state) =>Scaffold(
          body: Container(
            decoration: backgroundDecoration,
            child: Column(
              children: [

                Expanded(
                  child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    controller: boardController,
                    onPageChanged: (int index)
                    {
                      AppCubit.get(context).changeOnBoardingPage(index);
                    },
                    itemBuilder: (context,index)=>buildBoardingItem(boarding[index],context),
                    itemCount:boarding.length,
                  ),
                ),

              ],
            ),
          ),
        ),
      ),

    );
  }

  ///IMAGE, INDICATOR, TITLE
  Widget buildBoardingItem(BoardingModel model,context) => Padding(
    padding: const EdgeInsets.fromLTRB(40, 100, 40, 40),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,

      children:  [
        ///IMAGE
        Expanded(
          flex: 3,
          child: Stack(
           children: [
             Container(
               width: 500,
               height: 500,
               child: CustomPaint(
                 painter: CurveCustomPainter(points),
               ),
             ),
             Column(
               children: [
                 const SizedBox(height: 20,),
                 Image(
                   image: AssetImage(model.image),
                   height: 300,
                   fit: BoxFit.fitHeight,

                 ),
               ],
             ),

           ],
          ),
        ),
        ///INDICATOR
        Expanded(
          flex: 1,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              SmoothPageIndicator(
                controller: boardController,
                effect:  const ExpandingDotsEffect(
                  dotColor: Colors.grey,
                  //activeDotColor: defaultColor,
                  dotHeight: 10,
                  expansionFactor: 4,
                  dotWidth: 10,
                  spacing: 5,
                ),
                count: 3,
              ),

              // FloatingActionButton(
              //   onPressed: () {
              //     if(isLast)
              //     {
              //
              //       submit();
              //     }
              //     else
              //     {
              //       boardController.nextPage(
              //         duration: const Duration(
              //           microseconds: 750,
              //         ),
              //         curve: Curves.fastLinearToSlowEaseIn,
              //       );
              //     }
              //
              //
              //   },
              //   child: const Icon(
              //       Icons.arrow_forward_ios
              //   ),
              // ),
            ],
          ),
        ),
        ///TITLE
        Expanded(
          flex: 2,
          child: Text(
            model.title,
            maxLines: 2,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 34,
                overflow: TextOverflow.ellipsis


            ),
          ),
        ),
        ///GET STARTED BUTTON
        AppCubit.get(context).isLast
            ?defaultButton(text: 'Get Started', onPressed: () {  })
            :const SizedBox(height: 40,),

      ],
    ),
  );


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
