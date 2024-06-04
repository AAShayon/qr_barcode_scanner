

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery=MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                crossAxisCount: mediaQuery.orientation==Orientation.portrait?2:3,
              ),
              itemCount: buttonDataList.length,
              itemBuilder: (context,index){
                return Container(
                  // height: 90,
                  // width: 100,
                  decoration: BoxDecoration(
                      color: Colors.green.shade200
                  ),
                  child: Center(child: Text("${buttonDataList[index].title}")),
                );
              }
          )
        ],
      ),
    );
  }

}
List<ButtonData> buttonDataList = [
  ButtonData(title: "Create Qr Code",icon: null),
  ButtonData(title: "Create Bar Code",icon: null),
  ButtonData(title: "Scan Qr Code",icon: null),
  ButtonData(title: "Scan Bar Code",icon: null),
];
class ButtonData{
  String? title;
  Icon? icon;

  ButtonData({this.title,this.icon});

}
