import 'package:flutter/material.dart';
import 'package:yy/global_state.dart';

class Profile_Screen extends StatefulWidget {
  @override
  Profile_Screen_State createState() => Profile_Screen_State();
}

class Profile_Screen_State extends State<Profile_Screen> {
  Global_State _global_key = Global_State.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: true,
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text(
            "Hope 4 Cat",
            style: TextStyle(fontSize: 30),
          ),
        ),
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
        bottomNavigationBar: Row(
          children: [
            _build_bottom_navigation_bar_item(
              index: 0,
              icon: Icon(Icons.home),
              title: "home",
            ),
            _build_bottom_navigation_bar_item(
              index: 1,
              icon: Icon(Icons.file_upload),
              title: "Post",
            ),
            _build_bottom_navigation_bar_item(
              index: 2,
              icon: Icon(Icons.phone),
              title: "Phone",
            ),
            _build_bottom_navigation_bar_item(
              index: 3,
              icon: Icon(Icons.gamepad),
              title: "Game",
            ),
          ],
        ),
      ),
    );
  }

  //customised bottom navigation bar item
  Widget _build_bottom_navigation_bar_item(
      {int index, Icon icon, String title}) {
    return GestureDetector(
      onTap: () => setState(
        () {
          _global_key.navigation_bar_index = index;
          print(index); //check index
          if (index == 0)
            Navigator.of(context).pushReplacementNamed("/HomeScreen");
          else if (index == 1)
            Navigator.of(context).pushReplacementNamed("/UploadCatScreen");
          else if (index == 2)
            Navigator.of(context).pushReplacementNamed("/ProfileScreen");
        },
      ),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / 4,
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          gradient: _global_key.navigation_bar_index == index
              ? LinearGradient(
                  colors: [
                    Colors.green.withOpacity(0.9),
                    Colors.green.withOpacity(0.2),
                    Colors.green.withOpacity(0.01),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                )
              : LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white,
                  ],
                ),
        ),
        child: Column(
          children: [
            icon,
            Text(title),
          ],
        ),
      ),
    );
  }
}
