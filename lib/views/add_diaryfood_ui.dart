//add_diaryfoo_ui.dart
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddDiaryfoodUI extends StatefulWidget {
  const AddDiaryfoodUI({super.key});

  @override
  State<AddDiaryfoodUI> createState() => _AddDiaryfoodUIState();
}

class _AddDiaryfoodUIState extends State<AddDiaryfoodUI> {
  //ตัวแปรใช้กับ GroupValue ของ Radio ทีิิอยู่ในกลุ่มเดียวกัน

  int meal = 1;

  //ประกาศ/สร่างแปรเพิ่อเก็บข้อมูลตามรายการที่จะเอาไปใช้กับ DropdwonButton

  List<DropdownMenuItem<String>> items = [
    'กรุงเทพมหานคร',
    'กระบี่',
    'กาญจนบุรี',
    'กาฬสินธุ์',
    'กำแพงเพชร',
    'ขอนแก่น',
    'จันทบุรี',
    'ฉะเชิงเทรา',
    'ชลบุรี',
    'ชัยนาท',
    'ชัยภูมิ',
    'ชุมพร',
    'เชียงราย',
    'เชียงใหม่',
    'ตรัง',
    'ตราด',
    'ตาก',
    'นครนายก',
    'นครปฐม',
    'นครพนม',
    'นครราชสีมา',
    'นครศรีธรรมราช',
    'นครสวรรค์',
    'นนทบุรี',
    'นราธิวาส',
    'น่าน',
    'บึงกาฬ',
    'บุรีรัมย์',
    'ปทุมธานี',
    'ประจวบคีรีขันธ์',
    'ปราจีนบุรี',
    'ปัตตานี',
    'พระนครศรีอยุธยา',
    'พะเยา',
    'พังงา',
    'พัทลุง',
    'พิจิตร',
    'พิษณุโลก',
    'เพชรบุรี',
    'เพชรบูรณ์',
    'แพร่',
    'ภูเก็ต',
    'มหาสารคาม',
    'มุกดาหาร',
    'แม่ฮ่องสอน',
    'ยโสธร',
    'ยะลา',
    'ร้อยเอ็ด',
    'ระนอง',
    'ระยอง',
    'ราชบุรี',
    'ลพบุรี',
    'ลำปาง',
    'ลำพูน',
    'เลย',
    'ศรีสะเกษ',
    'สกลนคร',
    'สงขลา',
    'สตูล',
    'สมุทรปราการ',
    'สมุทรสงคราม',
    'สมุทรสาคร',
    'สระแก้ว',
    'สระบุรี',
    'สิงห์บุรี',
    'สุโขทัย',
    'สุพรรณบุรี',
    'สุราษฎร์ธานี',
    'สุรินทร์',
    'หนองคาย',
    'หนองบัวลำภู',
    'อ่างทอง',
    'อำนาจเจริญ',
    'อุดรธานี',
    'อุตรดิตถ์',
    'อุทัยธานี',
    'อุบลราชธานี'
  ]
      .map((e) => DropdownMenuItem<String>(
            value: e,
            child: Text(e),
          ))
      .toList();

  ///ประกาศ/สร้างตัวแปรเก็บจัวหวัด

  String foodProvince = 'กรุงเทพมหานคร';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'เพิ่มข้อมมูลอาหาร DiarFood',
          style: GoogleFonts.kanit(),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},

          //กดแล้วย้อนกลับไปหน้าก่อนหน้า

          icon: Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .075,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    border: Border.all(width: 4, color: Colors.green),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/banner.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.camera_alt,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ร้านอาหาร',
                  style: GoogleFonts.kanit(
                    color: Colors.grey[800],
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1,
                right: MediaQuery.of(context).size.width * 0.1,
                top: MediaQuery.of(context).size.width * 0.015,
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'ป้อนชื่อร้านอาหารด้วย',
                  helperStyle: GoogleFonts.kanit(
                    color: Colors.grey[400],
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1,
                top: MediaQuery.of(context).size.width * 0.015,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ค่าใช้จ่าย',
                  style: GoogleFonts.kanit(
                    color: Colors.grey[800],
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1,
                right: MediaQuery.of(context).size.width * 0.1,
                top: MediaQuery.of(context).size.width * 0.015,
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'ป้อนค่าใช่จ่าย',
                  helperStyle: GoogleFonts.kanit(
                    color: Colors.grey[400],
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1,
                top: MediaQuery.of(context).size.width * 0.015,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'อาหารมื้อ',
                  style: GoogleFonts.kanit(
                    color: Colors.grey[800],
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  onChanged: (int? value) {
                    setState(() {
                      meal = value!;
                    });
                  },
                  value: 1,
                  groupValue: meal,
                  activeColor: Colors.green,
                ),
                Text(
                  'เช้า',
                  style: GoogleFonts.kanit(),
                ),
                Radio(
                  onChanged: (int? value) {
                    setState(() {
                      meal = value!;
                    });
                  },
                  value: 2,
                  groupValue: meal,
                  activeColor: Colors.green,
                ),
                Text(
                  'กลางวัน',
                  style: GoogleFonts.kanit(),
                ),
                Radio(
                  onChanged: (int? value) {
                    setState(() {
                      meal = value!;
                    });
                  },
                  value: 3,
                  groupValue: meal,
                  activeColor: Colors.green,
                ),
                Text(
                  'เย็น',
                  style: GoogleFonts.kanit(),
                ),
                Radio(
                  onChanged: (int? value) {
                    setState(() {
                      meal = value!;
                    });
                  },
                  value: 4,
                  groupValue: meal,
                  activeColor: Colors.green,
                ),
                Text(
                  'ว่าง',
                  style: GoogleFonts.kanit(),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1,
                top: MediaQuery.of(context).size.width * 0.015,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'วันที่กิน',
                  style: GoogleFonts.kanit(
                    color: Colors.grey[800],
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1,
                right: MediaQuery.of(context).size.width * 0.1,
                top: MediaQuery.of(context).size.width * 0.02,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'เลือกวันที่',
                        hintStyle: GoogleFonts.kanit(
                          color: Colors.grey[400],
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.green,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.calendar_month,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1,
                top: MediaQuery.of(context).size.width * 0.015,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'จังหวัด',
                  style: GoogleFonts.kanit(
                    color: Colors.grey[800],
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1,
                top: MediaQuery.of(context).size.width * 0.015,
              ),
              child: Container(
                padding: EdgeInsets.all(9.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.green,
                  ),
                ),
                child: DropdownButton(
                  isExpanded: true,
                  items: items,
                  onChanged: (String? value) {
                    setState(() {
                      foodProvince = value!;
                    });
                  },
                  value: foodProvince,
                  underline:  SizedBox(),
                  style: GoogleFonts.kanit(
                    color: Colors.grey[800],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1,
                top: MediaQuery.of(context).size.width * 0.015,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ตำแหน่งที่ตั้ง',
                  style: GoogleFonts.kanit(
                    color: Colors.grey[800],
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1,
                top: MediaQuery.of(context).size.width * 0.015,
                right: MediaQuery.of(context).size.width * 0.1,
              ),
              child: Container(
                height: MediaQuery.of(context).size.width * 0.35,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.green)),
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(0.0, 0.0),
                    zoom: 12.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.1,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'บันทึกการกิน',
                style: GoogleFonts.kanit(),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                fixedSize: Size(
                  MediaQuery.of(context).size.width * 0.8,
                  MediaQuery.of(context).size.width * 0.07,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.1,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'ยกเลิก',
                style: GoogleFonts.kanit(),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                fixedSize: Size(
                  MediaQuery.of(context).size.width * 0.8,
                  MediaQuery.of(context).size.width * 0.07,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.1,
            ),
          ],
        ),
      ),
    );
  }
}
