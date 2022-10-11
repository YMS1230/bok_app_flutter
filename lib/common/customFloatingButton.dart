import 'package:flutter/material.dart';

class FloatingButtonCustomLocation extends FloatingActionButtonLocation {
  FloatingActionButtonLocation location;
  final double offsetX; // X方向的偏移量
  final double offsetY; // Y方向的偏移量

  FloatingButtonCustomLocation(this.location,
      {this.offsetX = 0, this.offsetY = 0});

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    Offset offset = location.getOffset(scaffoldGeometry);
    return Offset(offset.dx + offsetX, offset.dy + offsetY);
  }
}

class NoScalingAnimation extends FloatingActionButtonAnimator{
  late double _x;
  late double _y;
  @override
  Offset getOffset({required Offset begin, required Offset end, required double progress}) {
    _x = begin.dx +(end.dx - begin.dx)*progress ;
    _y = begin.dy +(end.dy - begin.dy)*progress;
    return Offset(_x,_y);
  }

  @override
  Animation<double> getRotationAnimation({required Animation<double> parent}) {
    return Tween<double>(begin: 1.0, end: 1.0).animate(parent);
  }

  @override
  Animation<double> getScaleAnimation({required Animation<double> parent}) {
    return Tween<double>(begin: 1.0, end: 1.0).animate(parent);
  }
}