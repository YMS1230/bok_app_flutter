
import 'package:bok_app_flutter/common/screen.dart';
import 'package:flutter/material.dart';

class InputNumberTextField extends StatelessWidget {
  const InputNumberTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: Screen.screenWidth - 56,
      // decoration: const BoxDecoration(color: Colors.red),
      child: Stack(
        children: [
          const Positioned(
            left: 0,
            top: 4,
            child: Text(
              "+91",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
              left: 40,
              top: 5,
              child: Container(
                width: 3,
                height: 14,
                decoration: const BoxDecoration(color: Color(0xFF888888)),
              )),
           const Positioned(
              left: 70,
              right: 142,
              height: 29,
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none, // 去掉下滑线
                  counterText: "",
                  hintText: "Enter phone number",
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
          ),
          Positioned(
              right: 0,
              top: 5,
              child: SizedBox(
                height: 18,
                child: InkWell(
                  child: const Text(
                    "Send Code",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                  onTap: () {},
                ),
              )),
        ],
      ),
    );
  }
}