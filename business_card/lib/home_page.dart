import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var phoneCtr = TextEditingController();
  var messageCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Business card')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 120,
                  width: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(300),
                    child: Image.asset(
                      'assets/ilmhub.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Ilmhub IT School',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () async {
                    launchUrl(Uri.parse("tel://+998934591708"));
                  },
                  child: SizedBox(
                    height: 60,
                    width: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(300),
                      child: Image.asset(
                        'assets/phone.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    launchUrl(
                        Uri.parse(
                          "https://t.me/ilmhubuz",
                        ),
                        mode: LaunchMode
                            .externalApplication // applicationdan ochish uchun agar buni yozmasa webdan ochadi
                        );
                  },
                  child: SizedBox(
                    height: 60,
                    width: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(300),
                      child: Image.asset(
                        'assets/telegram.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    launchUrl(
                        Uri.parse(
                          "https://instagram.com/ilmhub.uz?igshid=YmMyMTA2M2Y=",
                        ),
                        mode: LaunchMode.externalApplication);
                  },
                  child: SizedBox(
                    height: 60,
                    width: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(300),
                      child: Image.asset(
                        'assets/insta.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: phoneCtr,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'PhoneNumber'),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: messageCtr,
              maxLines: 5,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Enter message'),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  if(await requestSmsPermission(Permission.sms)){
                    _sendSMS(phoneCtr.text, messageCtr.text);
                  }else{
                    await Permission.sms.request();
                  }
                },
                child: Text('Send'))
          ],
        ),
      ),
    );
  }
}

void _composeSms() {
// #docregion sms
  final Uri smsLaunchUri = Uri(
    scheme: 'sms',
    path: '+998997696413',
    queryParameters: <String, String>{
      'body': Uri.encodeComponent('Example Subject & Symbols are allowed!'),
    },
  );
// #enddocregion sms
  launchUrl(smsLaunchUri);
}

Future<void> _sendSMS(String phone, String message) async {
  String result =
      await sendSMS(message: message, recipients: [phone], sendDirect: true)
          .catchError((onError) {
    print(onError);
  });
  print(result);
}

Future<bool> requestSmsPermission(Permission per) async {
  var status = await per.status;
  if (status.isGranted) {
    return true;
  } else {
   await per.request();
  }
  return false;
}
