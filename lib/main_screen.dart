import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  int counter = 0;
  void incrementFtn() async {
    final SharedPreferences sharedpreferences = await prefs;
    setState(() {
      counter++;
    });
    sharedpreferences .setInt('countervalue', counter);
  }

  void resetFtn()async {
    final SharedPreferences sharedpreferences  = await prefs;
    
      setState(() {
        counter = 0;
      });
    }
    void getInitialValue()async{
      final SharedPreferences sharedpreferences = await prefs;
      setState(() {
        counter=sharedpreferences.getInt('countervalue')?? 0;
      });

    }
    @override
  void initState() {
    super.initState();
    getInitialValue();
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          color: Colors.pink[100],
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            GestureDetector(
              onTap: () => incrementFtn(),
              child: CircleAvatar(
                radius: 150,
                backgroundColor: Colors.pink,
                child: Text(
                  '$counter',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 90,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: GestureDetector(
                  onTap: () => resetFtn(),
                  child: const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.pink,
                    child: Icon(Icons.refresh, size: 30.0),
                  ),
                ),
              ),
            ),
          ]),
        ),
      );
    }
  }