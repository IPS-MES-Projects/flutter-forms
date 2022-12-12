import 'package:flutter/material.dart';
import 'package:flutter_forms/form1/password_reset_form.dart';
import 'package:flutter_forms/form2/multi_text_form.dart';
import 'package:flutter_forms/form3/custom_form.dart';
import 'package:flutter_forms/form4/validating_form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Creating Forms with Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Flutter Forms'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        children: const <Widget>[
          PasswordResetForm(),
          MultiTextForm(),
          CustomForm(),
          ValidatingForm(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black45,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
            pageController.animateToPage(index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease);
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.aod_rounded), label: 'Form 1'),
          BottomNavigationBarItem(
              icon: Icon(Icons.aod_rounded), label: 'Form 2'),
          BottomNavigationBarItem(
              icon: Icon(Icons.aod_rounded), label: 'Form 3'),
          BottomNavigationBarItem(
              icon: Icon(Icons.aod_rounded), label: 'Form 4'),
        ],
      ),
    );
  }
}
