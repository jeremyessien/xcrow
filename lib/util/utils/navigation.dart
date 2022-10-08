import 'package:flutter/material.dart';

import 'brand_colors.dart';

void pushNamed(BuildContext context, String routeName, {Object? args}) =>
    Navigator.pushNamed(context, routeName, arguments: args);

Future<T?> push<T>(BuildContext context, Widget child) =>
    Navigator.of(context).push<T>(MaterialPageRoute(builder: (_) => child));

void pushReplacement(BuildContext context, Widget child) =>
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => child));
void pushReplaceNamed(BuildContext context, String routeName, {Object? args}) =>
    Navigator.pushReplacementNamed(context, routeName);
    
void pop(BuildContext context) => Navigator.of(context).pop();

void popToMain(BuildContext context) =>
    Navigator.of(context).popUntil((route) => route.isFirst);

void snack(BuildContext context, String message, {bool info = false}) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor:
            info ? BrandColors.colorGreen : BrandColors.colorOrange,
        content: Text(
          message,
          style: Theme.of(context).textTheme.subtitle1?.copyWith(
              color: Colors.white, fontSize: 13, fontWeight: FontWeight.w400),
        ),
        duration: const Duration(milliseconds: 1500),
      ),
    );
