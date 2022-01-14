//import 'package:flutter/cupertino.dart';
import 'package:berkana/widget_totalbar.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'widget_totalbar.dart';

class NetPage extends StatefulWidget {
  static String rote = 'netpage';
  const NetPage({Key? key}) : super(key: key);

  @override
  _NetPageState createState() => _NetPageState();
}

class _NetPageState extends State<NetPage> {
  late Future<Post> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: totalBar(context),
      drawer: totalDrawer(context),
      body: Center(
        child: FutureBuilder<Post>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return
                SizedBox(
                  width: 300,
                  height: 600,
                  child: ListView(
                    children: [
                      Text(snapshot.data!.id.toString(), style: Theme.of(context).textTheme.headline2,),
                      Text(snapshot.data!.userId.toString(), style: Theme.of(context).textTheme.headline2,),
                      Text(snapshot.data!.title, style: Theme.of(context).textTheme.headline1,),
                    ],
                  ),
                );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

Future<Post> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    return Post.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class Post {
  final int userId;
  final int id;
  final String title;

  Post({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
