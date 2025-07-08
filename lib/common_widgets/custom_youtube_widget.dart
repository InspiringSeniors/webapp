import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspiringseniorswebapp/common_widgets/text_button.dart';
import 'package:inspiringseniorswebapp/utils/color_utils.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubePlayerWidget extends StatefulWidget {
  final String videoId; // YouTube Video ID

  YoutubePlayerWidget({required this.videoId});

  @override
  _YoutubePlayerWidgetState createState() => _YoutubePlayerWidgetState();
}

class _YoutubePlayerWidgetState extends State<YoutubePlayerWidget> {
  late YoutubePlayerController _controller;

  @override
  void initState() {

    print("calling this");
    super.initState();
    _controller = YoutubePlayerController.fromVideoId(
      videoId: widget.videoId,
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,

      ),
    );


    print("calling this again");

  }

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height ;
    var width=MediaQuery.of(context).size.width ;



    var isMobile=width<800?true:false;
    return Column(
      children: [
        isMobile?Container(
          clipBehavior: Clip.hardEdge,
          height: 220,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          // Adjust as needed
          child: YoutubePlayer(
            controller: _controller,
            aspectRatio: 3 / 4,
            keepAlive: true,
          ),
        ):Container(
          clipBehavior: Clip.hardEdge,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          // Adjust as needed
          child: YoutubePlayer(
            controller: _controller,
            aspectRatio: 16 / 9,
            keepAlive: true,
          ),
        ),

      ],
    );
  }

  void _openYoutube() {
    final url = 'https://www.youtube.com/watch?v=${widget.videoId}';
    _controller.loadVideo(url); // Play video
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}


class YoutubePlayerWidgetHome extends StatefulWidget {
  final String videoId; // YouTube Video ID

  YoutubePlayerWidgetHome({required this.videoId});

  @override
  _YoutubePlayerWidgetStateHome createState() => _YoutubePlayerWidgetStateHome();
}

class _YoutubePlayerWidgetStateHome extends State<YoutubePlayerWidgetHome> {
  late YoutubePlayerController _controller;

  @override
  void initState() {

    print("calling this");
    super.initState();
    _controller = YoutubePlayerController.fromVideoId(
      videoId: widget.videoId,
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,

      ),
    );


    print("calling this again");

  }

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height ;
    var width=MediaQuery.of(context).size.width ;



    var isMobile=width<800?true:false;
    return Column(
      children: [
        isMobile?Container(
          margin: EdgeInsets.only(right: 10),
          clipBehavior: Clip.hardEdge,
          height: 180,
          width: width*0.8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          // Adjust as needed
          child: YoutubePlayer(
            controller: _controller,
            aspectRatio: 3 / 4,
            keepAlive: true,
          ),
        ):Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12))
          ),
          // Adjust as needed
          child: YoutubePlayer(
            controller: _controller,
            aspectRatio: 16 / 9,
            keepAlive: true,
          ),
        ),

      ],
    );
  }

  void _openYoutube() {
    final url = 'https://www.youtube.com/watch?v=${widget.videoId}';
    _controller.loadVideo(url); // Play video
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
