import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_sms/flutter_sms.dart';

class SmsAndCall{
  static void sendSMSToBYT(String message,List<String> recipents) async {
    String _result = await sendSMS(message: message, recipients: recipents)
        .catchError((onError) {
      print(onError);
    });
    print(_result);
  }
  static void callNumber() async{
    const number = '115'; //set the number here
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }
}