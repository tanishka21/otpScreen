import 'package:flutter/material.dart';
import 'package:otp_view/otp_screen.dart';


class SubmitScreen extends StatelessWidget {
  const SubmitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Send OTP\n Screen', style: TextStyle(color: Colors.white),),
      backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.blue.shade300,
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 50, right: 50),
                child: Text('Enter your phone number to get the OTP', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Colors.white),)),
            SizedBox(height: 50,),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> OtpScreen()));
            }, child: Text('Send OTP', style: TextStyle(color: Colors.white, fontSize: 20),),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,minimumSize: Size.fromHeight(60) ),
            ),
          ],
        ),
      ),
    );
  }
}
