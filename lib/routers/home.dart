import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bok_app_flutter/common/colors.dart';
import 'package:bok_app_flutter/widgets/video/column_social_icon.dart';
import 'package:bok_app_flutter/widgets/video/left_panel.dart';
import 'package:toast/toast.dart';
import 'package:video_player/video_player.dart';

import '../common/jh_common/widgets/progress_dialog.dart';

class HomeRouter extends StatefulWidget {
  const HomeRouter({super.key});

  @override
  HomeRouterState createState() => HomeRouterState();
}

class HomeRouterState extends State<HomeRouter>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController _tabController;

  var items = [];

  @override
  void initState() {
    super.initState();
    postRequest().then((List value) {
      var url = value[0]["tc_video_url"];
      // print('返回数据： $url');
      setState(() {
        items = value;
      });
      if (kDebugMode) {
        print('返回数据： $value');
      }
    });
  }

  Future<List> postRequest() async {
    var dio = Dio();
    var response =
        await dio.post("https://api.bikbok.io/video/videolist", data: {});
    var result = response.data["data"];
    return result;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    ToastContext().init(context);

    if (items.isNotEmpty) {
      _tabController = TabController(length: items.length, vsync: this);
      return getBody();
    } else {
      return const ProgressDialog();
    }
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return RotatedBox(
      quarterTurns: 1,
      child: TabBarView(
        controller: _tabController,
        children: List.generate(items.length, (index) {
          return VideoPlayerItem(
            videoUrl:
                items[index]['tc_video_url'].replaceAll('http://', 'https://'),
            size: size,
            name: items[index]['name_pub'],
            caption: items[index]['desp'],
            songName: '',
            profileImg: items[index]['headurl_pub'],
            likes: items[index]['likenum'],
            comments: items[index]['comentnum'],
            shares: items[index]['sharenum'],
            albumImg: items[index]['headurl_pub'],
          );
        }),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class VideoPlayerItem extends StatefulWidget {
  final String videoUrl;
  final String name;
  final String caption;
  final String songName;
  final String profileImg;
  final int likes;
  final int comments;
  final int shares;
  final String albumImg;
  const VideoPlayerItem(
      {Key? key,
      required this.size,
      required this.name,
      required this.caption,
      required this.songName,
      required this.profileImg,
      required this.likes,
      required this.comments,
      required this.shares,
      required this.albumImg,
      required this.videoUrl})
      : super(key: key);

  final Size size;

  @override
  VideoPlayerItemState createState() => VideoPlayerItemState();
}

class VideoPlayerItemState extends State<VideoPlayerItem> {
  late VideoPlayerController _videoController;
  bool isShowPlaying = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _videoController = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((value) {
        // _videoController.play();
        setState(() {
          // isShowPlaying = false;
        });
      });

    // //当前视频是否循环
    _videoController.setLooping(true);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoController.dispose();
  }

  Widget isPlaying() {
    return _videoController.value.isPlaying && !isShowPlaying
        ? Container()
        : Icon(
            Icons.play_arrow,
            size: 80,
            color: KColors.kMaterialBgColor.withOpacity(0.5),
          );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _videoController.value.isPlaying
              ? _videoController.pause()
              : _videoController.play();
        });
      },
      child: RotatedBox(
        quarterTurns: -1,
        child: Container(
            decoration: const BoxDecoration(color: Colors.black),
            height: widget.size.height,
            width: widget.size.width,
            child: Stack(
              children: <Widget>[
                Container(
                  height: widget.size.height,
                  width: widget.size.width,
                  decoration: const BoxDecoration(color: Colors.black),
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: AspectRatio(
                          //设置视频的大小 宽高比。长宽比表示为宽高比。例如，16:9宽高比的值为16.0/9.0
                          aspectRatio: _videoController.value.aspectRatio,
                          //播放视频的组件
                          child: VideoPlayer(_videoController),
                        ),
                      ),
                      // VideoPlayer(_videoController),
                      Center(
                        child: Container(
                          decoration: const BoxDecoration(),
                          child: isPlaying(),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: widget.size.height,
                  width: widget.size.width,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 0, bottom: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        // const HeaderHomePage(),
                        Expanded(
                            child: Row(
                          children: <Widget>[
                            LeftPanel(
                              size: widget.size,
                              name: widget.name,
                              caption: widget.caption,
                            ),
                            RightPanel(
                              size: const Size(20, 400),
                              likes: widget.likes.toString(),
                              comments: widget.comments.toString(),
                              shares: widget.shares.toString(),
                              profileImg: widget.profileImg,
                            )
                          ],
                        ))
                      ],
                    ),
                  ),
                )
              ],
            )
        ),
      ),
    );
  }
}

class RightPanel extends StatelessWidget {
  final String likes;
  final String comments;
  final String shares;
  final String profileImg;
  const RightPanel({
    Key? key,
    required this.size,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.profileImg,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: size.height,
        child: Column(
          children: <Widget>[
            Container(
              height: size.height * 0.25,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                getProfile(profileImg),
                getIcons(Icons.favorite, likes, 35.0),
                getIcons(Icons.comment, comments, 35.0),
                getIcons(Icons.reply, shares, 35.0),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
