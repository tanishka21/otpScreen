import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_view/submit_screen.dart';
import 'package:otp_view/verified_screen.dart';


class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool invalidOtp = false;
  int resendTime = 60;
  late Timer countdownTimer;
  TextEditingController txt1 = TextEditingController();
  TextEditingController txt2 = TextEditingController();
  TextEditingController txt3 = TextEditingController();
  TextEditingController txt4 = TextEditingController();
  TextEditingController txt5 = TextEditingController();
  TextEditingController txt6 = TextEditingController();

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  startTimer() {
    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        resendTime = resendTime - 1;

      });
      if(resendTime < 1) {
       countdownTimer.cancel();
      }

    });
  }

  reset() {
    if(resendTime!=0) {
      txt1.clear();
      txt2.clear();
      txt3.clear();
      txt4.clear();
      txt5.clear();
      txt6.clear();
    }
  }
  stopTimer() {
    if(countdownTimer.isActive) {
      countdownTimer.cancel();
    }
  }



String strFormatting(n)=> n.toString().padLeft(2, '0');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Screen', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(

              children: [
                SizedBox(height: 80,),
                Text('otp verification'.toUpperCase(), style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text('Enter the verifcation code here', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),),
                SizedBox(height: 70,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    inputBoxT(context, txt1),
                    inputBoxT(context, txt2),
                    inputBoxT(context, txt3),
                    inputBoxT(context, txt4),
                    inputBoxT(context, txt5),
                    inputBoxT(context, txt6),
                  ],
                ),
                SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Have not receive OTP yet?', style: TextStyle(fontSize: 18, color: Colors.grey),),
                    SizedBox(width: 10,),
                    resendTime == 0 ? GestureDetector(
                      onTap: () {
                        invalidOtp=false;
                        resendTime = 60;
                        startTimer();
                        reset();
                      },
                      child: Text('Resend', style: TextStyle(fontSize: 18, color: Colors.red),),
                    ) : const SizedBox(),
                  ],
                ),
                SizedBox(height: 10,),
                resendTime !=0 ? Text('You can send OTP after ${strFormatting(resendTime)} seconds', style: TextStyle(fontSize: 18, color: Colors.red, ),) : const SizedBox(),
                SizedBox(height: 10,),
                Text(invalidOtp ? 'Invalid OTP!' : '', style: TextStyle(color: Colors.red),),
                SizedBox(height: 30,),
                ElevatedButton(onPressed: () {
                  final otp = txt1.text + txt2.text + txt3.text + txt4.text + txt5.text + txt6.text;
                  print('OTP Entered by User == >>>  $otp');
                  if(otp == '123456') {

                   stopTimer();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => VerifiedScreen(),),);
                  } else {
                    setState(() {
                      invalidOtp = true;
                    });
                  }
                }, child: Text('Verify', style: TextStyle(color: Colors.white, fontSize: 20),),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, minimumSize: Size.fromHeight(60)),
                ),
              ],
            ),
          ),
        ),
      ),
      // Form(child: Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Container(
      //       margin: EdgeInsets.only(top: 300),
      //       height: 64,
      //       width: 48,
      //       child: TextFormField(
      //         onSaved: (pin1) {},
      //         onChanged: (value) {
      //           if (value.length == 1) {
      //             FocusScope.of(context).nextFocus();
      //           } else {
      //             FocusScope.of(context).previousFocus();
      //           }
      //         },
      //         autofocus: true,
      //         keyboardType: TextInputType.number,
      //         maxLength: 1,
      //         decoration: InputDecoration(counterText: ''),
      //         textAlign: TextAlign.center,
      //         style: Theme.of(context).textTheme.titleLarge,
      //       ),
      //     ),
      //     SizedBox(width: 5,),
      //     Container(
      //       margin: EdgeInsets.only(top: 300),
      //       height: 64,
      //       width: 48,
      //       child: TextFormField(
      //         onSaved: (pin2) {},
      //         onChanged: (value) {
      //           if (value.length == 2) {
      //             FocusScope.of(context).previousFocus();
      //           } else {
      //             FocusScope.of(context).nextFocus();
      //           }
      //         },
      //         autofocus: true,
      //         keyboardType: TextInputType.number,
      //         maxLength: 1,
      //         decoration: InputDecoration(counterText: ''),
      //         textAlign: TextAlign.center,
      //         style: Theme.of(context).textTheme.titleLarge,
      //       ),
      //     ),
      //     SizedBox(width: 5,),
      //     Container(
      //       margin: EdgeInsets.only(top: 300),
      //       height: 64,
      //       width: 48,
      //       child: TextFormField(
      //         onSaved: (pin3) {},
      //         onChanged: (value) {
      //           if (value.length == 3) {
      //             FocusScope.of(context).previousFocus();
      //           } else {
      //             FocusScope.of(context).nextFocus();
      //           }
      //         },
      //         autofocus: true,
      //         keyboardType: TextInputType.number,
      //         maxLength: 1,
      //         decoration: InputDecoration(counterText: ''),
      //         textAlign: TextAlign.center,
      //         style: Theme.of(context).textTheme.titleLarge,
      //       ),
      //     ),
      //     SizedBox(width: 5,),
      //     Container(
      //       margin: EdgeInsets.only(top: 300),
      //       height: 64,
      //       width: 48,
      //       child: TextFormField(
      //         onSaved: (pin4) {},
      //         onChanged: (value) {
      //           if (value.length == 4) {
      //             FocusScope.of(context).previousFocus();
      //           } else {
      //             FocusScope.of(context).nextFocus();
      //           }
      //         },
      //         textDirection: TextDirection.ltr,
      //
      //         autofocus: true,
      //         keyboardType: TextInputType.number,
      //         maxLength: 1,
      //         decoration: InputDecoration(counterText: ''),
      //         textAlign: TextAlign.center,
      //         style: Theme.of(context).textTheme.titleLarge,
      //       ),
      //     ),
      //     SizedBox(width: 5,),
      //     Container(
      //       margin: EdgeInsets.only(top: 300),
      //       height: 64,
      //       width: 48,
      //       child: TextFormField(
      //         onSaved: (pin5) {},
      //         onChanged: (value) {
      //           if (value.length == 5) {
      //             FocusScope.of(context).previousFocus();
      //           } else {
      //             FocusScope.of(context).nextFocus();
      //           }
      //         },
      //         textDirection: TextDirection.ltr,
      //
      //         autofocus: true,
      //         keyboardType: TextInputType.number,
      //         maxLength: 1,
      //         decoration: InputDecoration(counterText: ''),
      //         textAlign: TextAlign.center,
      //         style: Theme.of(context).textTheme.titleLarge,
      //       ),
      //     ),
      //     SizedBox(width: 5,),
      //     Container(
      //       margin: EdgeInsets.only(top: 300),
      //       height: 64,
      //       width: 48,
      //       child: TextFormField(
      //         onSaved: (pin6) {},
      //         onChanged: (value) {
      //           if (value.length == 6) {
      //             FocusScope.of(context).previousFocus();
      //           } else {
      //             FocusScope.of(context).nextFocus();
      //           }
      //         },
      //         textDirection: TextDirection.ltr,
      //
      //         autofocus: true,
      //         keyboardType: TextInputType.number,
      //         maxLength: 1,
      //         decoration: InputDecoration(counterText: ''),
      //         textAlign: TextAlign.center,
      //         style: Theme.of(context).textTheme.titleLarge,
      //       ),
      //     ),
      //   ],
      // ),),
      // Container(
      //   padding: EdgeInsets.only(left: 30, right: 30),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text('CO\nDE', style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 50.0),),
      //       SizedBox(height: 10),
      //       Text('verification'.toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold),),
      //       SizedBox(height: 80,),
      //       // OtpTextField(
      //       //   numberOfFields: 4,
      //       //   filled: true,
      //       //   fillColor: Colors.grey.shade300,
      //       //   keyboardType: TextInputType.number,
      //       //   onSubmit: (code) {
      //       //     if(code != '1234') {
      //       //       print('Incorrect OTP Entered');
      //       //       // SnackBar(content: AlertDialog(title: Text('Incorrect OTP Entered'),));
      //       //       ScaffoldMessenger.of(context).showSnackBar(
      //       //           SnackBar(
      //       //             content: const Text('Incorrect OTP Entered'),
      //       //             action: SnackBarAction(
      //       //               label: 'Ok',
      //       //               onPressed: () {
      //       //                 Navigator.push(context, MaterialPageRoute(builder: (context) => SubmitScreen(),),);
      //       //               },
      //       //             ),
      //       //           ),
      //       //       );
      //       //
      //       //     } else {
      //       //       print('OTP Entered =>>> $code');
      //       //     }
      //       //   },
      //       // ),
      //
      //       SizedBox(height: 20,),
      //       Container(
      //         padding: EdgeInsets.only(left: 10, top: 20, bottom: 20),
      //         decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomRight: Radius.circular(12))),
      //         width: double.infinity,
      //           child: ElevatedButton(onPressed: () {}, child: Text('Next'))),
      //     ],
      //   ),

    );
  }

  Widget inputBoxT(BuildContext context, TextEditingController controller) {
    return Container(

      width: 60,
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey.shade300),
        borderRadius: BorderRadius.all(Radius.circular(20),),
        color: Colors.grey.shade300,
      ),
      child: TextField(
        cursorHeight: 30,
        cursorColor: Colors.grey,
        controller: controller,
        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: 40,
        ),
        decoration: InputDecoration(
          counterText: '',
          border: InputBorder.none,
        ),
        maxLength: 1,
        textAlign: TextAlign.center,
        onChanged: (value) {
          if(value.length ==1) {
            FocusScope.of(context).nextFocus();
          } else {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }
}
