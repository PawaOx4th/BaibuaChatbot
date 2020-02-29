import 'package:baibuaapp/Widgets/notificationAlert.dart';
import 'package:baibuaapp/models/statWorkCount.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomAppBarr extends StatelessWidget {
  CustomAppBarr(
    @required this.namePage,
  );

  String namePage;

  //TextStyle
  TextStyle _googleFontRoboto = GoogleFonts.roboto(
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
    textStyle: TextStyle(color: Color.fromRGBO(0, 147, 233, 1)),
  );

  TextStyle _countwork =
      TextStyle(color: Colors.white70, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WorkCount(),
      child: AppBar(
        title: Text(
          namePage,
          style: GoogleFonts.kanit(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            textStyle: TextStyle(
              color: Color.fromRGBO(0, 147, 233, 1),
            ),
          ),
        ),
        centerTitle: true,
//        leading: null,
        backgroundColor: Colors.white,
        // automaticallyImplyLeading: false,
        leading: arrowBack(context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
        actions: [
          NotificationAlert(),
        ],
      ),
    );
  }

  // Widget Arrow back
  Widget arrowBack(context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
