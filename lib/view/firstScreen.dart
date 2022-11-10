import 'package:flutter/material.dart';

class First_Screen extends StatefulWidget {
  const First_Screen({Key? key}) : super(key: key);

  @override
  State<First_Screen> createState() => _First_ScreenState();
}

class _First_ScreenState extends State<First_Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
              ),
              height: 80,
              width: MediaQuery.of(context).size.width*0.95,
              child: Expanded(
                child: ListTile(
                  leading: Icon(Icons.dehaze_outlined),
                  title: Text("Khatabook",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  trailing: Icon(Icons.date_range,color: Colors.blue,),
                ),
              ),
            ),
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width*0.95,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
              ),
              child: Center(
                  child: Container(
                    height: 130,
                    width: MediaQuery.of(context).size.width*0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                  ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
              TextButton.icon(onPressed: (){

              }, icon: Icon(Icons.add,size: 15), label:Text("ADD CUSTOMER",style: TextStyle(fontSize: 15),));
          },
        ),
      ),
    );
  }
}
