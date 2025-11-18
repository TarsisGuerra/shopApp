import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop_app/components/auth_form.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(215, 117, 255, 1),
                  Color.fromRGBO(255, 188, 117, 1),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0, 1],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20.0),
                transform: Matrix4.rotationZ(-8 * pi / 180)
                  ..translate(
                    -10.0,
                  ), // the .. is a cascade operator and is used to call methods on the same object
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 70),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.deepOrange.shade900,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 8,
                      color: Colors.black26,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  'Minha Loja',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              AuthForm(),
            ],
          ),
        ],
      ),
    );
  }
}
