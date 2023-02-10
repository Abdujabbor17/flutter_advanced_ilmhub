import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../service/pref_service.dart';
import '../service/pref_service_list.dart';

class AddStudent extends StatefulWidget {
  static final String id = "home_page";

  @override
  _AddStudentState createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {

  final nameController = TextEditingController();
  List<String> list = [];
 // final passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      list =  await PrefsList.readListString();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 30),
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 15,right: 15),
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.grey[200]),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "Student name",
                    border: InputBorder.none,
                    icon: Icon(Icons.email,color: Colors.blue,),
                  ),
                ),
              ),
              SizedBox(height: 10,),
           /*   Container(
                padding: EdgeInsets.only(left: 15,right: 15),
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.grey[200]),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: InputBorder.none,
                    icon: Icon(Icons.lock,color: Colors.blue,),
                  ),
                ),
              ),*/
              SizedBox(height: 10,),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.blue),
                child: ElevatedButton(
                   onPressed: () async {
                   //String email = nameController.text.trim();
                  // String password = passwordController.text.trim();
                  // User user =  User(email: email, password: password, id: '123');
                     list.add(nameController.text.trim());
                   PrefsList.writeListString(list);
                     nameController.clear();
                     setState(() {});
                  },
                  child: Text("Add Student",style: TextStyle(color: Colors.white),),
                ),
              ),

              SizedBox(height: 40),
              FutureBuilder(
                future:  PrefsList.readListString(),
                builder: (context,snapshot) {
                  if(snapshot.hasData){
                    return ListView.builder(
                      shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context,i){
                      return Padding(padding: EdgeInsets.all(16),
                      child: Text(snapshot.data[i]),
                      );


                    });
                  }else{
                    return Text('No data');
                  }
                }
              )
            ],
          )),
    );
  }
}
