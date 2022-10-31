import 'package:bok_app_flutter/common/utils/screenUtils.dart';
import 'package:flutter/material.dart';

class InputPasswordTextField extends StatelessWidget {
  const InputPasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: ScreenUtils.screenWidth - 56,
      // decoration: const BoxDecoration(color: Colors.red),
      child: Stack(
        children: [
          const Positioned(
              left: 0,
              right: 0,
              height: 29,
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none, // 去掉下滑线
                  counterText: "",
                  hintText: "Verification code",
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFF888888),
                  ),
                ),
                maxLines: 1,
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white),
              )),
          Container(
            margin: const EdgeInsets.only(left: 0, right: 0, top: 39),
            height: 1,
            decoration: const BoxDecoration(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
