//home_ui.dart
//ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_diaryfood_app/models/diaryfood.dart';
import 'package:my_diaryfood_app/services/call_api.dart';
import 'package:my_diaryfood_app/views/add_diaryfood_ui.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  //สร้างตัวแปรเก็บข้อมูลที่ได้จากการเรียกใช้ API
  Future<List<Diaryfood>>? diaryfoodDataList;

  //สร้างเมธอดที่เรียกใช้ API
  getAllDiartfood() {
    setState(() {
      diaryfoodDataList = CallApi.callApiGetAllDiaryfood();
    });
  }

  //อะไรก็ตามที่อยู่ในเมธอด initState
  @override
  void initState(){
    getAllDiartfood();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'My Diary Food',
          style: GoogleFonts.kanit(),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //เปอดไปหน้า AddDiaryFoodUI แบบย้อนกลับได้
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddDiaryfoodUI(),
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: Column(
          children: [
            //แสดงรูปที่เตรียมไว้
            Image.asset(
              'assets/images/banner.jpg',
              fit: BoxFit.cover,
            ),
            //แสดงข้อมูลรายการกินที่ get มาจาก db ที่ server ในรูปของ ListView
            Expanded(
              child: FutureBuilder(
                future: CallApi.callApiGetAllDiaryfood(),
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
                    //เอาข้อมูลใส่ ListView
                    if (snapshot.data[0].message == '0') {
                      return Center(
                        child: Text(
                          'ยังไม่มีข้อมูล',
                          style: GoogleFonts.kanit(),
                        ),
                      );
                    } else {
                      return ListView.builder(
                        //นับจำนวนข้อมูลที่จะแสดงใน ListView
                        itemCount: snapshot.data.length,
                        //Layout ชอง ListView ที่จะนำข้อมูลมาแสดง
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              snapshot.data[index].foodShopname,
                            ),
                          );
                        },
                      );
                    }
                  }else if(snapshot.hasError){
                    return Center(
                        child: Text(
                          'มีข้อผิดหลาดเกิดขึ้น',
                          style: GoogleFonts.kanit(),
                        ),
                      );
                  }

                  return Center(
                    child: CircularProgressIndicator(
                      color:  Colors.green,
                    ),
                  );
                }
              ),
              ),
          ],
        ),
      ),
    );
  }
}