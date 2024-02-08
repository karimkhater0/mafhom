import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mafhom/layout/home_layout.dart';
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
        title: 'Welcome to Mafhom!',
        body: '''Experience the power of communication without barriers. Easily translate gestures into text and vice versa. Start communicating inclusively today!''',
        customPainter: VectorOnBoarding1(),
        value: 0.9166666666666666,
    ),
    BoardingModel(
        image: 'assets/images/onboarding/2.png',
        title: 'Learn,Translate and Connect.',
        body: ''' With Mafhom, learn new sign, translate effortless, and connect with the the deaf and dumb around you.''',
        customPainter: VectorOnBoarding2(),
        value: 1.011070110701107,
    ),
    BoardingModel(
        image: 'assets/images/onboarding/3.png',
        title: 'Unlock the world of Egyptian Sign Language.',
        body: 'Our app empowers you to bridge language gaps, Understand and be understood. Begin your journey to understanding Egyptian Sign Language with us.',
        customPainter: VectorOnBoarding3(),
        value: 1.0869565217391304,
    ),

  ];


  var width = 300.0;
  //late var height = width * 1.0638297872340425;


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
             CustomPaint(
               size: Size(width, width*model.value), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
               painter: model.customPainter,
             ),
             Image(
               image: AssetImage(model.image),
               height: width*model.value,
               fit: BoxFit.fitHeight,

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
                effect:  ExpandingDotsEffect(
                  dotColor: Colors.grey,
                  activeDotColor: primaryColor,
                  dotHeight: 15,
                  expansionFactor: 2.5,
                  dotWidth: 20,
                  spacing: 15,
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
          flex: 1,
          child: Text(
            model.title,

            maxLines: 3,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 29,
                overflow: TextOverflow.ellipsis


            ),
          ),
        ),
        ///BODY
        Expanded(
          flex: 2,
            child: Text(
              model.body,
              maxLines: 6,
              style: TextStyle(
                  fontSize: 20,
                  overflow: TextOverflow.ellipsis,
              ),


            ),

        ),
        ///GET STARTED BUTTON
        AppCubit.get(context).isLast
            ?defaultButton(

            text: 'Get Started',
            backGround: primaryColor,
            width: MediaQuery.of(context).size.width*.60,
            onPressed: () { 
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomeLayout(),),
                      (route) => false);
            },
        )
            :Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                defaultButton(
                    text: 'skip',
                    textColor: Colors.black,
                    backGround: Colors.white,
                    width: MediaQuery.of(context).size.width*.3,

                    onPressed: () {  }),
                defaultButton(
                    text: 'next',
                    backGround: primaryColor,
                    width: MediaQuery.of(context).size.width*.3,
                    onPressed: () {  }),
              ],
            )

      ],
    ),
  );


}



