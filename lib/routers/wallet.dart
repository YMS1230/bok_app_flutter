import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WalletRouter extends StatefulWidget {
  const WalletRouter({Key? key}) : super(key: key);

  @override
  State<WalletRouter> createState() => _WalletRouterState();
}

class _WalletRouterState extends State<WalletRouter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.green),
      width: 100,
      height: 100,
      child: Image.asset('images/tab/home_n.png'),
    );
  }
}
