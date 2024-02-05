import 'package:flutter/material.dart';

Decoration backgroundDecoration = const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Colors.white,
        Colors.blueAccent,
        /// ADD HEX COLOR
        // Color(0xff76a432),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    )
);