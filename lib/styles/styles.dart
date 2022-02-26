

import 'package:flutter/material.dart';

const TextTheme textTheme = TextTheme(
bodyText1: TextStyle(
  fontSize: 20,
  color: Colors.white,

),
button: TextStyle(
  fontSize: 20,
  color: Colors.white,

)
);

final  buttonStyle = ButtonStyle(
    fixedSize: MaterialStateProperty.all(const Size(200, 60)),
    backgroundColor:  MaterialStateProperty.all(Colors.black26)
);

final  buttonNavigationStyle = ButtonStyle(
    fixedSize: MaterialStateProperty.all(const Size(90, 50)),
    backgroundColor:  MaterialStateProperty.all(Colors.black26)
);

const TextStyle textStyle = TextStyle(
  fontSize: 20,
  color: Colors.white,

);