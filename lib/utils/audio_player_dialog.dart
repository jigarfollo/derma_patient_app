import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:follo_patient_app/utils/math_utils.dart';

class AudioPlayerDialog extends StatefulWidget {
  final String audioUrl;

  const AudioPlayerDialog({Key key, @required this.audioUrl}) : super(key: key);

  @override
  _AudioPlayerDialogState createState() => _AudioPlayerDialogState();
}

class _AudioPlayerDialogState extends State<AudioPlayerDialog> {
  AudioPlayer audioPlayer = new AudioPlayer();
  Duration duration = Duration();
  Duration position = Duration();
  bool playing = false;

  @override
  void dispose() {
    super.dispose();
    audioPlayer?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        height: screenWidth(context) * 0.35,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: getSize(30),
              offset: Offset(
                getSize(2),
                getSize(10),
              ),
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Play Audio'),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Slider.adaptive(
                  min: 0.0,
                  value: position.inSeconds.toDouble(),
                  max: duration.inSeconds.toDouble() == 0.0
                      ? 10.0
                      : duration.inSeconds.toDouble(),
                  onChanged: (double value) {
                    if (mounted) {
                      setState(() {
                        audioPlayer.seek(Duration(seconds: value.toInt()));
                        if (value == duration.inSeconds.toDouble()) {
                          playing = false;
                        }
                      });
                    }
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  getAudio();
                },
                child: Icon(
                  playing == false
                      ? Icons.play_arrow_rounded
                      : Icons.pause_rounded,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getAudio() async {
    var url = widget.audioUrl;

    if (playing) {
      var res = await audioPlayer.pause();
      if (res == 1) {
        if (mounted) {
          setState(() {
            playing = false;
          });
        }
      }
    } else {
      var res = await audioPlayer.play(url,
          position: Duration(seconds: position.inSeconds));
      if (res == 1) {
        if (mounted) {
          setState(() {
            playing = true;
          });
        }
      }
    }

    audioPlayer.onDurationChanged.listen((Duration d) {
      if (mounted) {
        setState(() {
          duration = d;
        });
      }
    });
    audioPlayer.onAudioPositionChanged.listen((Duration d) {
      if (mounted) {
        setState(() {
          position = d;
        });
      }
    });
  }
}
