import 'package:flutter/material.dart';

import 'constants.dart';


Widget defaultButton({
  double width = double.infinity,
  required Color backGround,
  Color textColor = Colors.white,
  double radius = 15,
  required String text,
  required void Function()? onPressed,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backGround,
      ),
      width: width,
      child: RawMaterialButton(
        onPressed: onPressed,
        child: Text(text,
            style:  TextStyle(
              color: textColor,
              fontSize: 20,
              fontWeight: FontWeight.bold
            )),
      ),
    );





navigateTo(context,widget)=>Navigator.push(
  context,
  MaterialPageRoute(builder: (context)=> widget()),
);

navigateAndFinish(context,widget)
{
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) =>widget()),
          (route)
      {
        return false;
      }
  );
}