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
    return Column(
      children: [
        Container(
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
        // SizedBox(height: 10),1
        // CustomButton(
        //   text: "Watch On Youtube",
        //   isHoverGetStarted: false.obs,
        //   vpadding: 10,
        //   hpadding: 16,
        //   hoveredColor: ColorUtils.HEADER_GREEN,
        //   bgColor: ColorUtils.BRAND_COLOR,
        //   fontSize: 16,
        //   shadowColor: ColorUtils.BRAND_COLOR_LIGHT,
        //   onpressed: (){
        //     _openYoutube();
        //   }
        // ),
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
