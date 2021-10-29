import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './splashScreen.dart';
import 'package:video_player/video_player.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainScreenState();
}
String id_card = "12345678";
class _MainScreenState extends State<MainScreen> {
  VideoPlayerController _controller;
  bool _visible = false;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/green_card_vid.mp4");
    _controller.initialize().then((_) {
      _controller.setLooping(true);
      Timer(Duration(milliseconds: 100), () {
        setState(() {
          _controller.play();
          _visible = true;
        });
      });
    });
  }

  _getVideoBackground() {
    return AnimatedOpacity(
      opacity: _visible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 1000),
      child: VideoPlayer(_controller),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: new Color(0xFF343440),
      body: Center(
        child: Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.2,
                  child: _getVideoBackground(),
                ),
              ],
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: new EdgeInsets.fromLTRB(0, 0, 35, 0),
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            "תו ירוק",
                            style: new TextStyle(
                                fontFamily: "ramzor-bold",
                                fontSize: 35,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: new EdgeInsets.fromLTRB(0, 0, 35, 0),
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            "תעודה זו מהווה גם תעודת מחוסן / מחלים",
                            style: new TextStyle(
                                fontFamily: "ramzor-regular",
                                fontSize: 18,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: new EdgeInsets.fromLTRB(0, 0, 35, 0),
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            "בהתאם לרישומי משרד הבריאות. התעודה תקפה",
                            style: new TextStyle(
                                fontFamily: "ramzor-regular",
                                fontSize: 18,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: new EdgeInsets.fromLTRB(0, 0, 35, 0),
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            "בישראל בלבד, בצירוף תעודה מזהה",
                            style: new TextStyle(
                                fontFamily: "ramzor-regular",
                                fontSize: 18,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: new EdgeInsets.fromLTRB(0, 45, 0, 0),
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            "12.03.2022 תוקף",
                            style: new TextStyle(
                                fontFamily: "ramzor-regular",
                                fontSize: 18,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: new EdgeInsets.fromLTRB(0, 45, 0, 0),
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            " | ",
                            style: new TextStyle(
                                fontFamily: "ramzor-regular",
                                fontSize: 18,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: new EdgeInsets.fromLTRB(0, 45, 65, 0),
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            "מזהה. " + (id_card),
                            style: new TextStyle(
                                fontFamily: "ramzor-regular",
                                fontSize: 18,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                      child: Padding(
                          padding: new EdgeInsets.fromLTRB(30, 45, 30, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 80,
                            decoration: BoxDecoration(
                              color: new Color(0XFF222126),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              image: DecorationImage(
                                  image: AssetImage("assets/general_qr.png"),
                                  scale: 1,
                                  alignment: Alignment.centerRight),
                            ),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                  padding: new EdgeInsets.fromLTRB(0, 0, 80, 0),
                                  child: Text(
                                    "לסריקה QR הצגת קוד",
                                    style: new TextStyle(
                                      fontFamily: "ramzor-bold",
                                      fontSize: 19,
                                      color: Colors.white,
                                    ),
                                  ) // button text
                                  ),
                            ),
                          )),
                      onTap: () {
                        showQRCode(context);
                      }),
                  GestureDetector(
                      child: Padding(
                          padding: new EdgeInsets.fromLTRB(30, 45, 30, 15),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: new Color(0XFF222126),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              image: DecorationImage(
                                  image: AssetImage("assets/trash.png"),
                                  scale: 25,
                                  alignment: Alignment.center),
                            ),
                          )),
                      onTap: () {
                        // showQRCode(context);
                      }),
                ],
              ),
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: new EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Image.asset(
                    'assets/abc_switch_track_mtrl_alpha.9.png',
                    color: Colors.blueAccent,
                    width: 20,
                    height: 20,
                  ),
                ),
              ],
            ),
            // width,
            Row(
              children: <Widget>[
                GestureDetector(
                    child: Padding(
                        padding: new EdgeInsets.fromLTRB(10, 45, 5, 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2.2,
                          height: 50,
                          decoration: BoxDecoration(
                            color: new Color(0XFF222126),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                                padding: new EdgeInsets.fromLTRB(0, 0, 25, 0),
                                child: Text(
                                  "חזרה לדף הבית",
                                  style: new TextStyle(
                                    fontFamily: "ramzor-semi-bold",
                                    fontSize: 19,
                                    color: Colors.white,
                                  ),
                                ) // button text
                                ),
                          ),
                        )),
                    onTap: () {
                      // showQRCode(context);
                    }),
                GestureDetector(
                    child: Padding(
                        padding: new EdgeInsets.fromLTRB(5, 45, 5, 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2.2,
                          height: 50,
                          decoration: BoxDecoration(
                              color: new Color(0xFF343440),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              border: Border.all(color: Colors.black)),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                                padding: new EdgeInsets.fromLTRB(0, 0, 25, 0),
                                child: Text(
                                  "הפקת תו ירוק נוסף",
                                  style: new TextStyle(
                                    fontFamily: "ramzor-semi-bold",
                                    fontSize: 19,
                                    color: Colors.white,
                                  ),
                                ) // button text
                                ),
                          ),
                        )),
                    onTap: () {
                      // showQRCode(context);
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

showQRCode(BuildContext context) {
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    insetPadding: EdgeInsets.all(15),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30))),
    actions: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 1.4,
        decoration: BoxDecoration(
            color: new Color(0xFF2F6FF),
            border: Border.all(
              color: new Color(0xFF2F6FF),
            )),
        child: Column(
          children: <Widget>[
            GestureDetector(
                child: Padding(
                    padding: new EdgeInsets.fromLTRB(275, 15, 5, 0),
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/x_close_dialog.png"),
                            scale: 1,
                            alignment: Alignment.topRight),
                      ),
                    )),
                onTap: () {
                  Navigator.of(context).pop();
                }),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: new EdgeInsets.fromLTRB(0, 25, 0, 5),
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          "12.03.2022 תוקף",
                          style: new TextStyle(
                              fontFamily: "ramzor-bold",
                              fontSize: 18,
                              color: new Color(0xFF61646d)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: new EdgeInsets.fromLTRB(0, 25, 0, 5),
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          " | ",
                          style: new TextStyle(
                              fontFamily: "ramzor-bold",
                              fontSize: 18,
                              color: new Color(0xFF61646d)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: new EdgeInsets.fromLTRB(0, 25, 25, 5),
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          "ת.ז. " + (id_card),
                          style: new TextStyle(
                              fontFamily: "ramzor-bold",
                              fontSize: 18,
                              color: new Color(0xFF61646d)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Padding(
                padding: new EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: QrImage(
                  data:
                      'UkvH3BVa0C9H7nxjbq/xVfBBTWHuQ6jto2CHrZBkJQsL11FoRDI5CfldBxwTRS5nNJRHs5zE84/F0uv9PZEgfOqM4U4aLCTEudUHx0zOySQXnnZjpw2n+aAnj8AzNGZSjJLu/834gIqqz+S8upj1kWBtH4/xKzL5RKMAl1W/9ktaaI8qniut1Y/e9w/9v+uTjjZETIdHgY6x2LccDErxZLgNPFJFxenucRvnm+dK1UoB6WgnIaPLNnM1AAF94eBL7U/ItGVQ5ktZukRFPA2fyCNJUzHZ1bXCZKRev44Di9R6FYwldq7oSPUshUNHhpy+6KNEIqiNvKzYnRWwEaJGzA==#{"id":"01/IL/D2435629AEFAB4B921D1F0CE567C99BC#A1E2B4DF","et":1,"ct":1,"c":"IL MOH","cn":null,"fn":null,"g":null,"f":null,"gl":null,"fl":null,"idp":null,"idl":null,"b":"0001-01-01","e":"0001-01-01","a":"0001-01-01","p":[{"idl":'+id_card+',"e":"2022-03-22"}]}',
                  size: 300,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
    elevation: 10,
    backgroundColor: new Color(0xFFF2F6FF),

    // content: QrImage(
    //   data: 'This is a simple QR code',
    //   version: QrVersions.auto,
    //   size: 20,
    //   gapless: false,
    // )
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
