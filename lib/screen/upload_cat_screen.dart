import 'package:flutter/material.dart';
import 'package:yy/global_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;
import 'package:progress_dialog/progress_dialog.dart';

class Upload_Cat_Screen extends StatefulWidget {
  @override
  Upload_Cat_Screen_State createState() => Upload_Cat_Screen_State();
}

class Upload_Cat_Screen_State extends State<Upload_Cat_Screen> {
  Global_State _global_key = Global_State.instance;
  TextEditingController _gender_controller = TextEditingController();
  TextEditingController _fee_controller = TextEditingController();
  //key for currentstate, it is used for the email & password input validator
  GlobalKey<FormState> _form_key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double _screen_height = MediaQuery.of(context).size.height;
    double _screen_width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: true,
        body: Container(
          child: Form(
            key: _form_key,
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    //upperpart
                    Container(
                      height: _screen_height / 3.6,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            //color: Colors.amber,
                            height: 150,
                            width: 210,
                            decoration: BoxDecoration(
                              border: Border.all(width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: GestureDetector(
                              child: Icon(
                                Icons.image,
                                size: 130,
                                color: Colors.green,
                              ),
                            ),
                          ),
                          // Image.asset(
                          //   'assets/images/logo.png',
                          //   height: 250,
                          //   width: 250,
                          // ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    //lowerpart
                    Container(
                      height: _screen_height - (_screen_height / 3.6),
                      color: Colors.amberAccent,
                      child: Column(
                        children: [
                          Container(
                            height: 90,
                            padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                            child: TextFormField(
                              controller: _gender_controller,
                              keyboardType: TextInputType.text,
                              autovalidate: true,
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: 'Please fill in gender'),
                              ]),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white70,
                                labelText: 'Gender',
                                icon: Icon(Icons.mail),
                                labelStyle: TextStyle(
                                  fontSize: 22,
                                  color: Colors.brown,
                                  fontWeight: FontWeight.bold,
                                ),
                                errorStyle: TextStyle(
                                    color: Colors.red,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(width: 2),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 90,
                            // color: Colors.green,
                            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: _fee_controller,
                              obscureText: true,
                              autovalidate: true,
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: 'Please fill in fee'),
                              ]),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white70,
                                labelText: 'Fee',
                                icon: Icon(Icons.lock),
                                labelStyle: TextStyle(
                                  fontSize: 22,
                                  color: Colors.brown,
                                  fontWeight: FontWeight.bold,
                                ),
                                errorStyle: TextStyle(
                                    color: Colors.red,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(width: 2),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 35,
                            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                            child: Row(
                              children: [
                                Icon(Icons.add_location),
                                Container(
                                  padding: EdgeInsets.fromLTRB(20, 0, 30, 0),
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil('/MapScreen',
                                              (Route<dynamic> route) => true);
                                      // Navigator.of(context)
                                      //     .pushReplacementNamed("/MapScreen");
                                    },
                                    child: Text(
                                      "Select Location",
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white,
                                      ),
                                    ),
                                    color: Colors.deepOrange[400],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 150,
                            // color: Colors.green,
                            padding: EdgeInsets.fromLTRB(30, 15, 30, 0),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: _fee_controller,
                              obscureText: true,
                              autovalidate: true,
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: 'Please fill in fee'),
                              ]),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white70,
                                labelText: 'Fee',
                                icon: Icon(Icons.lock),
                                labelStyle: TextStyle(
                                  fontSize: 22,
                                  color: Colors.brown,
                                  fontWeight: FontWeight.bold,
                                ),
                                errorStyle: TextStyle(
                                    color: Colors.red,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(width: 2),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 70,
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.fromLTRB(10, 0, 35, 25),
                            child: Container(
                              child: SizedBox(
                                height: 100,
                                width: 130,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  onPressed: () {
                                    //if the 2 input are corect, process this
                                    if (_form_key.currentState.validate()) {
                                      //_login();
                                    }
                                    // if the any input is failed, process this
                                    else {
                                      Toast.show(
                                        "Please fill in email and password",
                                        context,
                                        duration: 4,
                                        gravity: Toast.BOTTOM,
                                      );
                                    }
                                  },
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white,
                                    ),
                                  ),
                                  color: Colors.deepOrange[400],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
