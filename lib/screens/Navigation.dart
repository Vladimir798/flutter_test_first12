import 'package:flutter/material.dart';


class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  final _massengerKey = GlobalKey<ScaffoldMessengerState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _massengerKey,
      home: Scaffold (
        appBar: AppBar(),
        drawer: Drawer (
        child: ListView (
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
            decoration: const BoxDecoration(
            color: Colors.blue,
        ),
          child: Container (
            height: 200,
              child: Column (
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Container(
                  height: 100,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  ),
                  child: Image.network('https://repository-images.githubusercontent.com/205373971/def40d80-cb4c-11e9-971a-7434089990ed'),
                ),
                  const Text('Навигация во Flutter'),
                ],
              ),
          ),
        ),
            ListTile(
              leading: const Icon(Icons.one_k),
              title: const Text('Каталог'),
              onTap: () {
                },
            ),
        ListTile(
          leading: const Icon(Icons.two_k),
          title: const Text('Корзина'),
          onTap: () {
          },
        ),
            const Divider(),
            const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text('Профиль'),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Настройки'),
              onTap: () {
              },
            ),
          ],
        ),
        ),
        body: Text ("Содержание экрана"),
      ),
    );
  }
}
