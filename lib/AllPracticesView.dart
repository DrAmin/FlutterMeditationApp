import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_practical_task/utils/Color.dart';
import 'package:flutter_practical_task/utils/Constants.dart';
import 'MentalTrainingView.dart';
import 'custom/MyTextview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
        child: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('Popular').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
//            if (!snapshot.hasData) return Center(child: Text('Data not available, please wait till syncing process done'));
            if (!snapshot.hasData) return Center(child: CircularProgressIndicator(backgroundColor: Color(transBlackFontColor)));
            return ListView(
              children: snapshot.data.documents.map((DocumentSnapshot document) {
                return GestureDetector(
                  child: rowRecentPracticesCards(document),
                  onTap: (){
                    Navigator.of(context).push( MaterialPageRoute(
                        builder: (context)=> MentalTrainingView()));
                  },
                );
              }).toList(),
            );
          }
        )
      ),
    );
  }

  /*
  *
  *       body: Container(
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
  * */


  Widget rowRecentPracticesCards(DocumentSnapshot document)
  {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.network(document['imageURL']),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    MyTextview(
                      document['title'],
                      fontSize: 17,
                      color: Colors.black),
                    SizedBox(height: 5),
                    MyTextview(
                      document['duration'],
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

