import 'dart:math';
import 'package:flutter/material.dart';

class AppGradients {
  static final linear = LinearGradient(colors: [
    Color.fromRGBO(67, 48, 174, 0.75),
    Color.fromRGBO(69, 48, 179, 1),
  ], stops: [
    0.0,
    0.695
  ], transform: GradientRotation(2.13959913 * pi));
}
