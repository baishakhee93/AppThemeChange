import 'package:app_theme_change/redio_button_sample_code.dart';
import 'package:app_theme_change/theme_change.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Flutter Theme Demo'),
      title: 'Flutter Theme Demo',
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: currentTheme.currentTheme,
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({required this.title}) ;
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(

        title: Text(
          widget.title,
        /*  style: TextStyle(
            color: theme.accentColor,
          ),*/
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_4_rounded),
            onPressed: () {
              currentTheme.toggleTheme();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Fluter Themes Demo',
            ),
          ],
        ),
      ),
    );
  }
}