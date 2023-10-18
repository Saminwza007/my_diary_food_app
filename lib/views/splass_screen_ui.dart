//splass_screen_ui.dart
//ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_diaryfood_app/utils/gradient_text.dart';
import 'package:my_diaryfood_app/views/home_ui.dart';

class SplassScreemUI extends StatefulWidget {
  const SplassScreemUI({super.key});

  @override
  State<SplassScreemUI> createState() => _SplassScreemUIState();
}

class _SplassScreemUIState extends State<SplassScreemUI> {
  @override
  void initState() {
    // TODO: implement initState

    // คำสั่งในการหน่วงเวลา เพื่อเปิดไปยังหน้า HomeUI

    Future.delayed(
      // ระยะเวลาที่หน่วง

      Duration(seconds: 3),

      //พอครบที่กำหนด จะให้เปิดไปหน้า HomeUI

      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeUI(),
        ),
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.bowlFood,
                  size: MediaQuery.of(context).size.width * 0.35,
                  color: Colors.amber,
                ),
                Text(
                  'My Diary Food',
                  style: GoogleFonts.kanit(
                    fontSize: MediaQuery.of(context).size.width * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'บันทึกการกิน V.1.0',
                  style: GoogleFonts.kanit(
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.04,
                ),
                CircularProgressIndicator(
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GradientText(
                  'Created by Thanakit DTI-SAU',
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue,
                      Colors.red,
                      Colors.purple,
                      Colors.amber,
                      Colors.pink,
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
