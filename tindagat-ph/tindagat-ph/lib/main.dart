import 'package:flutter/material.dart';
import 'package:tindagat/theme/style.dart';

import 'package:tindagat/screens/uploadstock/uploadstockscreen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp>{
  int _selectedIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tindagat',
      theme: appTheme(),
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(title: const Text('Welcome to Tindagat')),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  'Submit Image of Captured Fishes',
                  style: TextStyle(fontSize: 20)
                ),
                const SizedBox(height: 30), 
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UploadStockScreen()));
                  },
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text(
                    'Add Here',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            )
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(blurRadius: 20, color: Colors.blue.withOpacity(.4))
            ]),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                child: GNav(
                    gap: 2,
                    activeColor: Colors.white,
                    iconSize: 24,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                    duration: Duration(milliseconds: 500),
                    tabBackgroundColor: Colors.blue[800],
                    tabs: [
                      GButton(
                        icon: LineIcons.home,
                        text: 'Home',
                      ),
                      GButton(
                        icon: LineIcons.user,
                        text: 'Account',
                      ),
                    ],
                    selectedIndex: _selectedIndex,
                    onTabChange: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    }),
              ),
            ),
          ),
        )
      )
    );
  }
  
}