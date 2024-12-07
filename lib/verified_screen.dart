import 'package:flutter/material.dart';
import 'package:otp_view/submit_screen.dart';


class VerifiedScreen extends StatelessWidget {
  const VerifiedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('OTP Verified', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black87),),),
      body: Container(
        padding: EdgeInsets.only(left: 50, right: 50),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,

          children: [

            SizedBox(height: 100,),
            Padding(
              padding: EdgeInsets.only(left: 60, right: 50),
                child: Text('OTP Verified Successfully', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500, color: Colors.blue),)),
            SizedBox(height: 100,),
            ElevatedButton(

              onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SubmitScreen()));
            }, child: Text('Go Back', style: TextStyle(color: Colors.white, fontSize: 20),),

              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, minimumSize: Size.fromHeight(60), ),
            ),
          ],
        ),
      ),
    );
  }
}
