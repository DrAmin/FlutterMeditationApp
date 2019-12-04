import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practical_task/utils/Constants.dart';
import 'package:flutter_practical_task/utils/dimens.dart';

import 'custom/CustomSeekbarView.dart';
import 'custom/MyTextview.dart';


class MentalTrainingView extends StatefulWidget {
  @override
  _MentalTrainingViewState createState() => _MentalTrainingViewState();
}

class _MentalTrainingViewState extends State<MentalTrainingView> {
  double _value = 0.0;
  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();
  bool isAudioStop = false;
  int totalDuration;

  @override
  void initState() {
    super.initState();
    _value = 0.0;
    startMusic();
    _assetsAudioPlayer.finished.listen((value){

    });
  }

  void startMusic(){
    isAudioStop = false;
    _assetsAudioPlayer.open(
      AssetsAudio(
        asset: "senorita.mp3",
        folder: "assets/",
      ),
    );
    _assetsAudioPlayer.current.listen((event){
      totalDuration =  event.duration.inMilliseconds;
      print("TOTAL DURATION $totalDuration");
    });
  }

  void _playPause() {
    _assetsAudioPlayer.playOrPause();
  }

  @override
  void dispose() {
    _assetsAudioPlayer.stop();
    super.dispose();
  }

  void stopMusic(){
    isAudioStop = true;
    _assetsAudioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: getBodyContentView(context),
      ),
    );
  }

  getBodyContentView(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageName.MEDIA_SCREEN_BG),
          fit: BoxFit.fill
        )
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(Dimens.dimen_10dp,Dimens.dimen_20dp,Dimens.dimen_10dp,Dimens.dimen_10dp),
            child: Stack(
              children: <Widget>[
                Center(child:MyTextview("Mental Training",fontSize: Dimens.dimen_18dp)),
                Positioned(
                    right: 0,
                    child: GestureDetector(
                      child: Icon(Icons.close,color: Colors.white),
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                    )
                )
              ],
            ),
          ),
          Center(
            child: Icon(Icons.keyboard_arrow_down,color: Colors.white),
          ),
          Flexible(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(Dimens.dimen_20dp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.favorite_border,color: Colors.white),
                        StreamBuilder(
                          stream: _assetsAudioPlayer.isPlaying,
                          initialData: false,
                          builder: (BuildContext context, AsyncSnapshot<bool> snapshot)
                          {
                            return IconButton(
                                iconSize: 40,
                                onPressed: isAudioStop ? startMusic : _playPause,
                                icon : Icon(snapshot.data
                                  ? Icons.pause_circle_outline : Icons.play_arrow
                                  ,color: Colors.white, size:40)
                            );
                          },
                        ),
                        Icon(Icons.equalizer,color: Colors.white),
                      ],
                    ),
                    SizedBox(height: Dimens.dimen_20dp),
                    StreamBuilder(
                      stream: _assetsAudioPlayer.currentPosition,
                      builder: (BuildContext context,
                          AsyncSnapshot<Duration> snapshot) {
                        Duration duration = snapshot.data;
                        if(duration!=null){
                          _value = (duration.inMilliseconds/totalDuration).toDouble()*100;
                        }
                        return CustomSeekbarview(
                          _value,
                          min: 0,
                          max: 100,
                          divisions: 100,
                          onChanged: ((value){
                            _value = value;
                          }),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}

