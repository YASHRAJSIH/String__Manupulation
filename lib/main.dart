//import 'dart:html';
import 'package:flutter/services.dart';

import 'prctice.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(StringManupulation());
}

class StringManupulation extends StatefulWidget {
  const StringManupulation({Key? key}) : super(key: key);

  @override
  State<StringManupulation> createState() => _StringManupulationState();
}

class _StringManupulationState extends State<StringManupulation> {
  var input = TextEditingController();
  var skip = TextEditingController();
  var output;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text("String Manupulation",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                )),
            shadowColor: Colors.deepOrangeAccent),
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: TextFormField(
                    inputFormatters: <TextInputFormatter>[
                      // for below version 2 use this
                      FilteringTextInputFormatter.allow(RegExp("[\. ,a-zA-Z]")),
                      // for version 2 and greater youcan also use this
                    ],
                    controller: input,
                    decoration: InputDecoration(
                      hintText: "Enter the String",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      suffixIcon:IconButton(onPressed:(){
                        // clear text in box
                        input.clear();
                      }, icon: Icon(Icons.do_not_disturb_alt_sharp)),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      // for below version 2 use this
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      // for version 2 and greater youcan also use this
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    controller: skip,
                    decoration: InputDecoration(
                      hintText: "Enter The Skip Number",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      suffixIcon:IconButton(onPressed:(){
                        // clear text in box
                        skip.clear();
                      }, icon: Icon(Icons.do_not_disturb_alt_sharp)),
                    )
                ),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: ElevatedButton(
                      onPressed: () {

                        setState((){
                          String uEmail = input.text.toString();
                          String num = skip.text.toString();
                          print("yashraj,$uEmail,$num");
                          output = string_manipulation(uEmail, num);
                        });

                      },
                      child: Text("Submit",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    )),
                Expanded(
                  child: Container(

                      child: Center(
                        child: Text("Manupulated String:-$output",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


String string_manipulation(String str, String number) {
  // String str="My name is sam.This is my luckey day.i like coding so much.this is it";
  // int skip=2;
  str.trim();
  int skip = int.parse(number);
  int max =-1;
  String ans = "";
      List<String> splitline=str.split(".");
      for(int i = 0; i < splitline.length; i++) {// Max length
        List<String> words = splitline[i].split(" ");
        if (max < words.length) { // Getting the max length
          max = words.length;
        }
      }
      max=max-1;

      if(skip>max){
        print("invlid Number");
        return "Invalid Skip Number";
      }
      else if(skip==max){
        print("All the Strings");
        return str;
      }
      else {
        for (int i = 0; i < splitline.length; i++) {
          List<String> words = splitline[i].split(" ");
          //ans += words
          if (words.length>=skip) {
            // comparing
            for (int p = words.length - skip - 1; p >= 0; p--) { //
              ans += words[p] + " ";
            }
            for (int j = words.length - skip; j < words.length; j++) {
              ans += words[j] + " ";
            }
            ans += ".";
          }else{
            for(int a=0;a<words.length;a++){
              ans += words[a] + " ";
            }
            ans += ".";
          }
        }
        return ans;
      }
}
