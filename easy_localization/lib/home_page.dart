import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("title".tr()),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("greeting".tr()),

          ElevatedButton(onPressed: (){
            print(context.locale.languageCode);

          }, child: Text('get locale lang')),
           ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, '/GetImage');

          }, child: Text('Get Image')),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: (){
                    context.setLocale(const Locale('uz','UZ'));
                    setState(() {});
                  },
                  child: const Text(
                    'Uzbek'
                  )),
              ElevatedButton(
                  onPressed: (){
                    context.setLocale(const Locale('ru','RU'));
                    setState(() {});
                  },
                  child: const Text(
                    'русский'
                  )),
              ElevatedButton(
                  onPressed: (){
                    context.setLocale(const Locale('en','US'));
                    setState(() {});
                  },
                  child: const Text(
                    'English'
                  )),

            ],
          )
        ],
      ),
    );
  }
}
