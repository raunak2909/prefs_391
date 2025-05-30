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
  int count = 0;
  Color bgColor = Colors.white;

  @override
  void initState(){
    super.initState();
    ///get
    getName();
  }

  void getName() async{
    prefs = await SharedPreferences.getInstance();
    name = prefs!.getString("name") ?? "Default";
    count = prefs!.getInt("count") ?? 0;
    count++;
    prefs!.setInt("count", count);
    if(count%3==0 && count%5==0){
      bgColor = Colors.orange.shade200;
    } else if(count%3==0){
      bgColor = Colors.blue.shade200;
    } else if(count%5==0){
      bgColor = Colors.red.shade200;
    } else {
      bgColor = Colors.white;
    }
    print(name);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: Text("$count", style: TextStyle(fontSize: 300, color: Colors.black12),),
              ),
            ),
            Column(
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
          ],
        ),
      ),
    );
  }
}

/// 0. Practise the above code by your own.
/// 1. Tell the user how many times they have opened the app
/// 2. Change the background color to blue on every 3rd time they open the app
/// 3. Change the background color to red on every 5th time they open the app
/// 4. Change the background color to orange on every multiple of 3 and 5 time they open the app