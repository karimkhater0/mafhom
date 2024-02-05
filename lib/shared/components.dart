import 'package:flutter/material.dart';

import 'constants.dart';


Widget defaultButton({
  double width = double.infinity,
  //Color backGround = ,
  double radius = 15,
  required String text,
  required void Function()? onPressed,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: primaryColor,
      ),
      width: width,
      child: RawMaterialButton(
        onPressed: onPressed,
        child: Text(text,
            style: const TextStyle(
              color: Colors.white,
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