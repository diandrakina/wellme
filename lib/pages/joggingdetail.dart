import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:well_me/styles/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:well_me/widget/bottomNavbar.dart';

import 'package:video_player/video_player.dart';

class JoggingDetailPage extends StatefulWidget{
  const JoggingDetailPage({super.key});

  @override
  State<JoggingDetailPage> createState() => _JoggingDetailPageState();
}

class _JoggingDetailPageState extends State<JoggingDetailPage>{

  late VideoPlayerController _controller;

  void initState(){
    super.initState();
    _controller = VideoPlayerController.asset(
      'assets/videos/wellmejogging.mp4',
    )
    ..initialize().then((_){
      setState(() {});
      _controller.play();
      _controller.setLooping(true);
    });
  }

  @override
  void dispose () {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Current Jogging"),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: _controller.value.isInitialized ? 
            AspectRatio(aspectRatio: _controller.value.aspectRatio, child: VideoPlayer(_controller),) : CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}