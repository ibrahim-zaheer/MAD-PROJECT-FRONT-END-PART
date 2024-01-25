import 'package:flutter/material.dart';
import 'package:api_demo/models/post.dart';
import 'package:api_demo/services/remote_service.dart';

class display_page extends StatefulWidget {
  const display_page({Key? key}) : super(key: key);

  @override
  State<display_page> createState() => _display_pageState();
}

class _display_pageState extends State<display_page> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    //fetch data from API
    getData();
  }

  getData() async {
    posts = await RemoteService().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  TextEditingController texter = new TextEditingController();
  // TextEditingController createDate = new TextEditingController();

  List<Post>? _post;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: Column(
        children: [
          Container(
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter text here"),
              controller: texter,
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                String body = texter.text;
                // DateTime created = DateTime.parse(createDate.text);
                List<Post>? post = await RemoteService().sendPosts(body);
                setState(() {
                  _post = post;
                });
              },
              child: Text("Click on me")),
        ],
      ),
    );
  }
}
