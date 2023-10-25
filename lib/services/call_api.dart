// ignore_for_file: unused_import

import 'package:http/http.dart';
import 'dart:convert';
import 'dart:io';

import 'package:my_diaryfood_app/models/diaryfood.dart';
import 'package:http/http.dart' as http;

class CallApi{
  //เมธอดเรียกใช้ API: getall
  static Future<List<Diaryfood>> callApiGetAllDiaryfood() async{
    final response = await http.get(
      Uri.parse('http://172.17.36.8/diaryfoodapi/getall'),
      headers: {'Content-Type':'application/json'},
    );

    if (response.statusCode == 200){
      //เอาข้อมูลที่ส่งกลับมาเป็นJSON แปลงเป็นข้อมูลที่จะนำมาใช้ในแอปฯ เก็บในตัวแปร
      final responseData = jsonDecode(response.body);

      //แปลงข้อมูลให้เป็นList และเก็บในตัวแปร List
      final DiaryfoodDataList = await responseData.map<Diaryfood>((json){
        return Diaryfood.fromJson(json);
      }).toList();

      //ส่ง่าข้อมูลที่เก็บในตัวแปร List กลับไป ณ จุดที่เรียกใช้เมธอดนี้ เพื่อนำข้อมูลไปใช้งาน
      return DiaryfoodDataList;
    }else {
      throw Exception('Failed to fetch data');
    }
  }

  //เมธอดเรียกใช้ API: insert
  static Future<String> classApiInserDiaryfood(Diaryfood diaryfood) async{
    //เรียกใช้API
    final response = await http.post(
      Uri.parse('http://172.17.36.8/diaryfoodapi/insert'),
      body: jsonEncode(diaryfood.toJson()),
      headers: {'Content-Type':'application/json'},
    );

    if(response.statusCode == 200) {
      //
      final responseData = jsonDecode(response.body);

      return responseData['message'];
    }else {
      throw Exception('Failed to fetch data');
    }
  }

  //เมธอดเรียกใช้ API: update
  static Future<String> classApiUpdateDiaryfood(Diaryfood diaryfood) async{
    final response = await http.post(
      Uri.parse('http://172.17.36.8/diaryfoodapi/update'),
      body: jsonEncode(diaryfood.toJson()),
      headers: {'Content-Type':'application/json'},
    );

    if(response.statusCode == 200) {
      //
      final responseData = jsonDecode(response.body);

      return responseData['message'];
    }else {
      throw Exception('Failed to fetch data');
    }
  }

  //เมธอดเรียกใช้ API: delet
  static Future<String> calApiDeletDiaryfood(Diaryfood diaryfood) async{
    final response = await http.post(
      Uri.parse('http://172.17.36.8/diaryfoodapi/delete'),
      body: jsonEncode(diaryfood.toJson()),
      headers: {'Content-Type':'application/json'},
    );

    if(response.statusCode == 200) {
      //
      final responseData = jsonDecode(response.body);

      return responseData['message'];
    }else {
      throw Exception('Failed to fetch data');
    }
  }
}
