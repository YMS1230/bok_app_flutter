import 'package:flutter/material.dart';

class LeftPanel extends StatelessWidget {
  final String name;
  final String caption;
  const LeftPanel({
    Key? key,
    required this.size,
    required this.name,
    required this.caption,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.8,
      height: size.height,
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            name,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            caption,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
