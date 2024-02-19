import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class PostApi extends StatefulWidget {
  const PostApi({super.key});

  @override
  State<PostApi> createState() => _PostApiState();
}

class _PostApiState extends State<PostApi> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void login(String email, password) async{
    try {
      Response response= await post(Uri.parse('https://reqres.in/api/register'),
      body: {
        'email':email,
        'password':password,
      }

      );
      if (response.statusCode==200) {
       print('account created succesully'); 
      }
      else{
        print('failed');
      }
      
    } catch (e) {
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('API call'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: email,
              decoration: InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)
      
                )
              ),
      
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: password,
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)
      
                )
              ),
      
            ),
            SizedBox(
              height: 15,
            ),
         GestureDetector(
          onTap: (){
            login(email.text.toString(),password.text.toString());
          },
           child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: Text('Login'),),
         
           ),
         ),
          ],
        ),
      )
    );
  }
}