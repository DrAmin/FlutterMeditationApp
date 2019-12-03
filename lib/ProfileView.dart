import 'package:flutter/material.dart';
import 'package:flutter_practical_task/utils/Color.dart';
import 'package:flutter_practical_task/utils/Constants.dart';
import 'package:flutter_practical_task/utils/dimens.dart';

import 'custom/MyTextview.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: getBodyContent(context),
      ));
  }

  getBodyContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimens.dimen_15dp),
      child: ListView(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.favorite,color: Color(cardBlueColor)),
              Expanded(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: Dimens.dimen_10dp),
                      CircleAvatar(
                        backgroundColor: Color(darkBlueColor),
                        radius: 50,
                        child: Image.asset(ImageName.PROFILE_PIC),
                      ),
                      SizedBox(height: Dimens.dimen_10dp),
                      MyTextview(
                        "Natalia Lebediva",
                        fontSize: Dimens.dimen_24dp,
                        color: Colors.black,
                        fontName: FontName.SF_SEMI_BOLD,
                      )
                    ],
                  )),
              Image.asset(ImageName.SETTING),
            ],
          ),
          SizedBox(height: Dimens.dimen_15dp),
          rowDescriptionBox(darkBlueColor,ImageName.LESSONS_ICON,"Practices","13","4:23:04"),
          SizedBox(height: Dimens.dimen_15dp),
          rowDescriptionBox(pinkBg,ImageName.MEDITATION_ICON,"Meditations","6","0:55:04"),
        ],
      ),
    );
  }


  Widget rowDescriptionBox(int iconBGColor,String icon,String title,String sessions,String time)
  {
    return Container(
      padding: EdgeInsets.all(Dimens.dimen_20dp),
      decoration: BoxDecoration(
        color: Color(cardGreyBg),
        borderRadius: BorderRadius.circular(Dimens.dimen_20dp)
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: Dimens.dimen_30dp,
                height: Dimens.dimen_30dp,
                decoration: BoxDecoration(
                  color: Color(iconBGColor),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(icon),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn)
                  )
                ),
              ),
              SizedBox(width: Dimens.dimen_10dp),
              MyTextview(
                title,
                fontSize: Dimens.dimen_20dp,
                color: Colors.black,
                fontName: FontName.SF_SEMI_BOLD,
              )
            ],
          ),
          SizedBox(height: Dimens.dimen_10dp),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  MyTextview("Sessions",color: Color(greyIconColor),fontName: FontName.SF_REGULAR,),
                  SizedBox(width: Dimens.dimen_10dp),
                  MyTextview(sessions,color: Colors.black,fontSize: Dimens.dimen_24dp,fontName: FontName.SF_REGULAR,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  MyTextview("Time",color: Color(greyIconColor),fontName: FontName.SF_REGULAR,),
                  SizedBox(width: Dimens.dimen_10dp),
                  MyTextview(
                    time,
                    color: Colors.black,
                    fontSize: Dimens.dimen_24dp,
                    fontName: FontName.SF_REGULAR,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

}

