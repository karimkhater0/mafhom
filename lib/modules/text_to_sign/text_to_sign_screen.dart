import 'package:flutter/material.dart';
import 'package:mafhom/shared/constants.dart';

class TTSScreen extends StatelessWidget {
  const TTSScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Container(
          decoration: backgroundDecoration,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: screenHeight(context)*.5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(15),

                  ),
                ),

                Container(
                  height: screenHeight(context)*.15,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),


                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextField(
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Write your text here...',


                          ),

                        ),
                        Spacer(),
                        Row(
                          children: [
                            Spacer(),
                            IconButton(onPressed: (){}, icon: Icon(Icons.bookmark)),
                            IconButton(onPressed: (){}, icon: Icon(Icons.mic)),
                            IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt_outlined)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}