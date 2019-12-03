import 'package:flutter/material.dart';
import 'package:flutter_practical_task/utils/Color.dart';
import 'package:flutter_practical_task/utils/Constants.dart';

import 'MentalTrainingView.dart';
import 'custom/MyTextview.dart';

class PracticesView extends StatefulWidget {
  @override
  _PracticesViewState createState() => _PracticesViewState();
}

class _PracticesViewState extends State<PracticesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        title: MyTextview("Popular",color: Colors.black,fontSize: 16),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context,index){
            return GestureDetector(
              child: rowRecentPracticesCards(index),
              onTap: (){
                Navigator.of(context).push( MaterialPageRoute(
                    builder: (context)=> MentalTrainingView()));
              },
            );
          }
        ),
      ),
    );
  }

  Widget rowRecentPracticesCards(int index) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(ImageName.NATURE),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    MyTextview(
                        "Mental Training",
                        fontSize: 17,
                        color: Colors.black),
                    SizedBox(height: 5),
                    MyTextview(
                        "3 min 43 sec",
                        fontSize: 15,
                        color: Colors.black),
                  ],
                ),
              ),
              Icon(
                Icons.favorite_border,
                color: Color(greyIconColor),
              )
            ],
          ),
        ),
        Divider(
          height: 1,
          color: Colors.grey,
        )
      ],
    );
  }



}

