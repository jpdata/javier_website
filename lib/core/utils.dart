import 'package:flutter/material.dart';

class Utils {
  static double screenHzRelation(BuildContext context) =>
      MediaQuery.of(context).size.width / 1920;
  static double screenVtRelation(BuildContext context) =>
      MediaQuery.of(context).size.height / 1080;
  static double adjustToScreenHzRel(BuildContext context, double value) =>
      value * screenHzRelation(context);
  static double adjustToScreenVtRel(BuildContext context, double value) =>
      value * screenVtRelation(context);
}
