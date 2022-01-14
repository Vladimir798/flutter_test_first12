import 'package:berkana/widget_totalbar.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_test_first/widget_totalbar.dart';

class ForgetPage extends StatelessWidget {
  static String rote = 'ForgetPage';
  const ForgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: totalBar(context),
        drawer: totalDrawer(context),
        body: Container(
          color: Colors.white,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const Expanded(
                    child: Center(
                      child: Text('Всего хорошего',
                        textAlign: TextAlign.center,
                      ),
                    )
                ),
                Image.asset('assets/Геометриякруг.png')
              ],
            ),
          ),
        )
    );
  }
}