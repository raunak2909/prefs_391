import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var nameController = TextEditingController();
  SharedPreferences? prefs;
  String name = "";

  @override
  void initState(){
    super.initState();
    ///get
    getName();
  }

  void getName() async{
    prefs = await SharedPreferences.getInstance();
    name = prefs!.getString("name") ?? "Default";
    print(name);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome: $name"),
            TextField(
              controller: nameController,
            ),
            ElevatedButton(onPressed: () async{
              ///set
              /*SharedPreferences prefs = await SharedPreferences.getInstance();
              */
              prefs!.setString("name", nameController.text);
            }, child: Text('Save'))
          ],
        ),
      ),
    );
  }
}
