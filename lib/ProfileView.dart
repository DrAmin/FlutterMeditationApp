import 'package:flutter/material.dart';
import 'package:flutter_practical_task/utils/Color.dart';
import 'package:flutter_practical_task/utils/Constants.dart';
import 'package:flutter_practical_task/utils/dimens.dart';
import 'custom/MyTextview.dart';
import 'models/ModelChartData.dart';
import 'package:charts_flutter/flutter.dart' as charts;

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
      child: ListView(
        padding: EdgeInsets.all(Dimens.dimen_15dp),
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
          SizedBox(height: Dimens.dimen_15dp),
          rowWeeklyProgressGraphView()
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

  Widget rowWeeklyProgressGraphView(){
    return Container(
      padding: EdgeInsets.all(Dimens.dimen_20dp),
      decoration: BoxDecoration(
          color: Color(cardGreyBg),
          borderRadius: BorderRadius.circular(Dimens.dimen_20dp)
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MyTextview(
                "Stats",
                color: Colors.black,
                fontSize: Dimens.dimen_18dp,
                fontName: FontName.SF_SEMI_BOLD,
              ),
              MyTextview(
                "Last week",
                color: Colors.black,
                fontSize: Dimens.dimen_13dp,
                fontName: FontName.SF_SEMI_BOLD,
              )
            ],
          ),
          SizedBox(height: Dimens.dimen_15dp),
          identificationView(darkBlueColor,"Practices","0:43:05"),
          SizedBox(height: Dimens.dimen_10dp),
          identificationView(pinkBg,"Meditations","0:15:45"),
          SizedBox(height: Dimens.dimen_10dp),
          Container(
            height: 200,
            child: charts.BarChart(
              _loadWeekData(),
              animate: true,
              primaryMeasureAxis: charts.NumericAxisSpec(renderSpec: new charts.NoneRenderSpec()),
              domainAxis: new charts.OrdinalAxisSpec(
                showAxisLine: false,
//                renderSpec: charts.NoneRenderSpec(),
                viewport: new charts.OrdinalViewport('AePS', 7),
              ),
              behaviors: [
                charts.PanAndZoomBehavior(),
              ],
              barGroupingType: charts.BarGroupingType.stacked,
            )
          )

        ],
      ),
    );
  }

  Widget identificationView(int identityColor,String title,String time)
  {
    return Row(
      children: <Widget>[
        Container(
          width: Dimens.dimen_10dp,
          height: Dimens.dimen_10dp,
          decoration: BoxDecoration(
              color: Color(identityColor),
              shape: BoxShape.circle
          ),
        ),
        SizedBox(width: Dimens.dimen_10dp),
        MyTextview(title,color: Color(transBlackFontColor)),
        SizedBox(width: Dimens.dimen_20dp),
        Icon(Icons.access_time,size: 20,color: Color(transBlackFontColor)),
        SizedBox(width: Dimens.dimen_10dp),
        MyTextview(time,color: Color(transBlackFontColor)),
      ],
    );
  }

  static List<charts.Series<ModelChartData, String>> _loadWeekData() {
    final practiceData = [
      new ModelChartData("Mon", 10),
      new ModelChartData("Tue", 20),
      new ModelChartData("Wen", 8),
      new ModelChartData("Thu", 6),
      new ModelChartData("Fri", 14),
      new ModelChartData("Sat", 14),
      new ModelChartData("Sun", 8),
    ];

    final meditationData = [
      new ModelChartData("Mon", 0),
      new ModelChartData("Tue", 0),
      new ModelChartData("Wen", 6),
      new ModelChartData("Thu", 6),
      new ModelChartData("Fri", 0),
      new ModelChartData("Sat", 8),
      new ModelChartData("Sun", 10),
    ];


    return [
      new charts.Series<ModelChartData, String>(
        id: 'Meditations',
        colorFn: (ModelChartData sales,_) => charts.ColorUtil.fromDartColor(Color(pinkBg)),
        domainFn: (ModelChartData sales, _) => sales.xLabel,
        measureFn: (ModelChartData sales, _) => sales.value,
        data: meditationData,
      ),
      new charts.Series<ModelChartData, String>(
        id: 'Practices',
        colorFn: (ModelChartData sales,_) => charts.ColorUtil.fromDartColor(Color(darkBlueColor)),
        domainFn: (ModelChartData sales, _) => sales.xLabel,
        measureFn: (ModelChartData sales, _) => sales.value,
        data: practiceData,
      ),
    ];
  }



}

