import 'package:flutter/material.dart';

class HeaderHomePage extends StatelessWidget {
  const HeaderHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Following",
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 16,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          "|",
          style: TextStyle(
            color: Colors.white.withOpacity(0.3),
            fontSize: 17,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        const Text(
          "For You",
          style: TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
