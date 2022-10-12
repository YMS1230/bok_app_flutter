import 'package:bok_app_flutter/common/screen.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'dart:core';

void main() => runApp(VideoApp());

//视频播放器封装需要使用动态类
class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

//继承VideoApp类
class _VideoAppState extends State<VideoApp> {
  //定义一个VideoPlayerController
  late VideoPlayerController _controller;
  var  dura; //视频播放比

  //重写类方法initState()，初始化界面
  @override
  void initState() {
    super.initState();
    //设置视频参数 (..)是级联的意思
    _controller = VideoPlayerController.network(
        'https://1312343062.vod2.myqcloud.com/111e5efbvodcq1312343062/921d9068387702304420729216/f0.mp4')
      ..initialize().then((_) {
        // 确保在初始化视频后显示第一帧，直至在按下播放按钮。
        setState(() {});
      });

    //执行监听，只要有内容就会刷新
    _controller.addListener(() {
      setState(() {
        //进度条的播放进度，用当前播放时间除视频总长度得到
        dura=_controller.value.position.inSeconds/
            _controller.value.duration.inSeconds;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: Center(
          //  _controller.value.initialized表示视频是否已加载并准备好播放，
          // 如果是true则返回AspectRatio（固定宽高比的组件,宽高比为视频本身的宽高比）
          // VideoPlayer为视频插放器，对像就是前面定义的_controller
          child:Wrap(
            alignment: WrapAlignment.center,
            children: [

              SizedBox(
                width: Screen.screenWidth,
                height: Screen.screenHeight,
                child:  _controller.value.isInitialized
                    ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )

                //如果视频没有加载好或者因网络原因加载不出来则返回Container 组件
                //一般用于放置过渡画面
                    : Container(
                  child:Center(
                    //视频加载时的圆型进度条
                    child: CircularProgressIndicator(
                      strokeWidth: 4.0,
                      backgroundColor: Colors.blue,
                      // value: 0.2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                    ),
                  ),
                ),
              ),

              //视频进度条
              LinearProgressIndicator(
                backgroundColor: Colors.greenAccent,
                value:dura,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              ),
              //打印的视频内容，供调试参考
              Text(_controller.value.toString()),
              Text("${dura}"),

            ],
          ),
        ),

        //右下角图标按钮onPressed中需要调用setState方法，用于刷新界面
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              print(_controller.value.toString());
              print(_controller.value.errorDescription);
              //_controller.value.isPlaying：判断视频是否正在播放
              //_controller.pause()：如果是则暂停视频。
              // _controller.play():如果不是则播放视频
              _controller.value.isPlaying
                  ? _controller.pause(): _controller.play();
            });
          },

          //子组件为按钮图标
          //_controller.value.isPlaying：判断视频是否正在播放
          //Icons.pause：如果是则显示这个图标
          //Icons.play_arrow：如果不是，则显示这个图标
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  //dispose():程序中是用来关闭一个GUI页面的
  //视频播放完需要把页面关闭
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}