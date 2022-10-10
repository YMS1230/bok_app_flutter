import 'package:flutter/cupertino.dart';

class HomeRouter extends StatefulWidget {
  const HomeRouter({Key? key}) : super(key: key);

  @override
  State<HomeRouter> createState() => _HomeRouterState();
}

class _HomeRouterState extends State<HomeRouter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: CupertinoColors.black),
    );
  }
}
