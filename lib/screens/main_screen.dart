import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:news_app/screens/new_details.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var URL = Uri.parse("https://codesundar.com/wp-json/wp/v2/posts");
  List _news = [];

  getNews() async {
    try {
      await http.get(URL).then((res) {
        setState(() {
          var data = json.decode(res.body);
          _news = data;
        });
      }).catchError((e) {});
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("News app",
            style: TextStyle(color: Colors.blue, fontSize: 28)),
        actions: [
          IconButton(
            onPressed: () {
              getNews();
            },
            icon: const Icon(
              Icons.refresh,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: _news.isEmpty
              ? const Text("Please make request")
              : ListView.builder(
                  itemCount: _news.length,
                  itemBuilder: (bc, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(NewDetailsScreen(
                            title: _news[index]['title']['rendered'],
                            description: _news[index]['yoast_head_json']
                                ['description'],
                            imageUrl: _news[index]['yoast_head_json']
                                ['og_image'][0]['url'],
                            date: _news[index]['modified'],
                            status: _news[index]['status'],
                            link: _news[index]['link']));
                      },
                      child: Container(
                        margin:
                            const EdgeInsets.only(left: 16, right: 16, top: 16),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  right: 8, left: 8, top: 8, bottom: 8),
                              width: 132,
                              height: 132,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(14)),
                                color: Colors.blue.withOpacity(0.2),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "${_news[index]['yoast_head_json']['og_image'][0]['url']}",
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                          right: 8, top: 4),
                                      child: Text(
                                        "${_news[index]['title']['rendered']}",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "${_news[index]['yoast_head_json']['description']}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Badge(
                                          toAnimate: false,
                                          shape: BadgeShape.square,
                                          badgeColor: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          badgeContent: Text(
                                            "${_news[index]['status']}",
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "${_news[index]['modified']}",
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              flex: 100,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
