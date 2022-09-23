import 'package:flutter/material.dart';

CustomTheme currentTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = false;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Colors.lightBlue,
      accentColor: Colors.white,
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        color: Colors.blue[700],
        brightness: Brightness.dark,
        elevation: 0,
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        textTheme: TextTheme(
          headline1: TextStyle(color: Colors.white),
          headline2: TextStyle(color: Colors.white),
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),

      textTheme: TextTheme(
        headline1: TextStyle(color: Colors.black),
        headline2: TextStyle(color: Colors.black),
        bodyText1: TextStyle(color: Colors.black),
        bodyText2: TextStyle(color: Colors.black),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: Colors.black,
     // accentColor: Colors.red,
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        color: Colors.blue[900],
        brightness: Brightness.dark,
        elevation: 0,
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        textTheme: TextTheme(
          headline1: TextStyle(color: Colors.white),
          headline2: TextStyle(color: Colors.white),
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      iconTheme: IconThemeData(
          color: Colors.green[400]
      ),
      textTheme: TextTheme(
        headline1: TextStyle(color: Colors.black),
        headline2: TextStyle(color: Colors.black),
        bodyText1: TextStyle(color: Colors.black),
        bodyText2: TextStyle(color: Colors.black),
      ),
    );
  }
}



/* static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Colors.indigo,
      accentColor: Colors.white,
      backgroundColor: Colors.amberAccent,
      appBarTheme: AppBarTheme(
        color: Colors.blue[500],
        brightness: Brightness.light,
        elevation: 0,
        iconTheme: IconThemeData(
            color: Colors.white
        ),
          textTheme: TextTheme(
      headline1: TextStyle(color: Colors.white),
      headline2: TextStyle(color: Colors.white),
      bodyText1: TextStyle(color: Colors.white),
      bodyText2: TextStyle(color: Colors.white),
    ),

        //I want the defaults, which is why I'm copying an 'empty' ThemeData
        //perhaps there's a better way to do this?

      ),
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
        headline1: TextStyle(color: Colors.black),
        headline2: TextStyle(color: Colors.black),
        bodyText1: TextStyle(color: Colors.black),
        bodyText2: TextStyle(color: Colors.black),
      ),
      iconTheme: IconThemeData(
        color: Colors.green
      )
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: Colors.black,
      accentColor: Colors.red,
      appBarTheme: AppBarTheme(
        color: Colors.blue[900],
        brightness: Brightness.dark,
        elevation: 0,
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        textTheme: TextTheme(
          headline1: TextStyle(color: Colors.white),
          headline2: TextStyle(color: Colors.white),
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.grey,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
        headline1: TextStyle(color: Colors.black),
        headline2: TextStyle(color: Colors.black),
        bodyText1: TextStyle(color: Colors.black),
        bodyText2: TextStyle(color: Colors.black),
      ),
    );
  }*/