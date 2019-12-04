import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_practical_task/utils/Color.dart';
import 'package:flutter_practical_task/utils/Constants.dart';
import 'package:flutter_practical_task/utils/dimens.dart';

import 'AllPracticesView.dart';
import 'MentalTrainingView.dart';
import 'ProfileView.dart';
import 'custom/MyTextview.dart';

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> with SingleTickerProviderStateMixin{
  int selectedTabPosition = 0;

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 4, vsync: this);
    _tabController.addListener(_handleTabSelection);

  }


  void _handleTabSelection() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
          length: 4,
            child: Scaffold(
            body: TabBarView(
                children: [
                  getBodyContentView(context),
                  getBodyContentView(context),
                  getBodyContentView(context),
                  ProfileView()
                ],
              controller: _tabController,
            ),
            bottomNavigationBar: TabBar(
              controller: _tabController,
              indicatorColor: Color(darkBlueColor),
              tabs: [
                Tab(icon: Image.asset(ImageName.HOME_ICON, color: _tabController.index == 0 ? Color(darkBlueColor): Color(greyIconColor))),
                Tab(icon: Image.asset(ImageName.LESSONS_ICON, color: _tabController.index == 1 ? Color(darkBlueColor): Color(greyIconColor))),
                Tab(icon: Image.asset(ImageName.MEDITATION_ICON, color: _tabController.index == 2 ? Color(darkBlueColor): Color(greyIconColor))),
                Tab(icon: Image.asset(ImageName.PROFILE_ICON, color: _tabController.index == 3 ? Color(darkBlueColor): Color(greyIconColor)))
              ],
            ),
          )
      )
    );
  }

  Widget getBodyContentView(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height/2.3,
          child: Stack(
           children: <Widget>[
             Container(
               height: MediaQuery.of(context).size.height/2.5,
               decoration: BoxDecoration(
                   color: Color(darkBlueColor),
                   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
               ),
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 SizedBox(width: Dimens.dimen_20dp),
                 Expanded(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                       SizedBox(height: Dimens.dimen_20dp),
                       MyTextview(
                         "DAY 7",
                         color: Color(lightGrayFontColor),
                         fontName: "SFSemiBold",
                       ),
                       SizedBox(height: Dimens.dimen_5dp),
                       MyTextview(
                         "Love and Accept Yourself",
                         fontSize: Dimens.dimen_30dp,
                         fontName: "SFSemiBold",
                       )
                     ],
                   ),
                 ),
                 Container(
                   margin: EdgeInsets.only(top: Dimens.dimen_20dp),
                   child: Image.asset(
                     ImageName.NATURE_2,
                   ),
                 )
               ],
             ),
             Positioned(
               bottom: 1,
               right: 1,
               child: Image.asset(
                 ImageName.GIRL,
               ),
             ),
             Positioned(
               bottom: 1,
               left: 1,
               child: Image.asset(
                 ImageName.NATURE_1,
                 fit: BoxFit.fill,
               ),
             ),
           ],
          ),
        ),
        SizedBox(height: Dimens.dimen_10dp),
        Container(
          padding: EdgeInsets.fromLTRB(15,10,15,10),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: MyTextview(
                    CV.POPULAR,
                    color: Colors.black,
                    fontSize: Dimens.dimen_16dp,
                    fontName: FontName.SF_REGULAR,
                  )
              ),
              GestureDetector(
                child: Container(
                  child: MyTextview(
                    CV.SEE_ALL,
                    color: Color(blueAccentColor),
                    fontSize: Dimens.dimen_14dp,
                    fontName: FontName.SF_REGULAR,
                  ),
                ),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PracticesView()));
                },
              )
            ],
          ),
        ),
        Container(
          height: Dimens.dimen_170dp,
          child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(5),
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return GestureDetector(
                  child: rowPopularEvents(index),
                  onTap: (){
                    Navigator.of(context).push( MaterialPageRoute(
                        builder: (context)=> MentalTrainingView()));
                  },
                );
              }
          ),
        ),
        SizedBox(height: Dimens.dimen_10dp),
        Container(
          padding: EdgeInsets.fromLTRB(Dimens.dimen_15dp,
              Dimens.dimen_10dp,
              Dimens.dimen_15dp,
              Dimens.dimen_10dp),
          child: Row(
            children: <Widget>[
              Expanded(
                child: MyTextview(
                  CV.NEW,
                  color: Colors.black,
                  fontSize: Dimens.dimen_16dp,
                  fontName: FontName.SF_REGULAR,
                )
              ),
              GestureDetector(
                child: Container(
                  child: MyTextview(CV.SEE_ALL,
                    color: Colors.lightBlue,
                    fontSize: Dimens.dimen_14dp,
                    fontName: FontName.SF_REGULAR,
                  ),
                ),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PracticesView()));
                },
              )
            ],
          ),
        ),
        Container(
          height: Dimens.dimen_170dp,
          child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(Dimens.dimen_5dp),
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return GestureDetector(
                  child: rowNewEvents(index),
                  onTap: (){
                    Navigator.of(context).push( MaterialPageRoute(
                        builder: (context)=> MentalTrainingView()));
                  },
                );
              }
          ),
        )
      ],
    );
  }

  Widget rowPopularEvents(int index) {
    return Container(
      margin: EdgeInsets.only(left: 10,right: 10),
      padding: EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: Color(cardBlueColor),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MyTextview(
                  "Anxiety",
                  fontSize: Dimens.dimen_24dp,
                  fontName: "SFSemiBold",
                ),
                MyTextview(
                  "Turn down the stress volume",
                  fontSize: Dimens.dimen_16dp,
                  color: Color(lightWhiteColor),
                  fontName: "SFRegular",
                ),
                SizedBox(height: Dimens.dimen_30dp),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: MyTextview(
                    "7 Steps | 5-11 min",
                    fontSize: Dimens.dimen_12dp,
                    color: Color(lightWhiteColor),
                    fontName: "SFLight",
                  ),
                )
              ],
            ),
          ),
          Image.asset(ImageName.POPULAR_TREE)
        ],
      ),
    );
  }

  Widget rowNewEvents(int index) {
    return Container(
      margin: EdgeInsets.only(left: Dimens.dimen_10dp,right: Dimens.dimen_10dp),
      padding: EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
          color: Color(cardOrangeColor),
          borderRadius: BorderRadius.circular(Dimens.dimen_20dp)
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MyTextview(
                  "Hapiness",
                  fontSize: Dimens.dimen_24dp,
                  fontName: "SFSemiBold",
                ),
                MyTextview(
                  "Daily Calm",
                  fontSize: Dimens.dimen_16dp,
                  fontName: "SFRegular",
                ),
                SizedBox(height: Dimens.dimen_30dp),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: MyTextview(
                    "7 Steps | 5-11 min",
                    fontSize: Dimens.dimen_12dp,
                    fontName: "SFLight",
                  ),
                )
              ],
            )
          ),
          Image.asset(ImageName.SUN)
        ],
      ),
    );
  }

}


