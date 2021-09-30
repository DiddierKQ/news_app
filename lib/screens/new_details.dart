import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class NewDetailsScreen extends StatelessWidget {
  //const NewDetailsScreen({ Key? key }) : super(key: key);

  String title;
  String description;
  String imageUrl;
  String date;
  String status;
  String link;

  NewDetailsScreen({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.date,
    required this.status,
    required this.link,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading:
            const BackButton(color: Colors.black), // color of the back button
        elevation: 0,
        title: const Text(
          "",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 28,
          ),
        ),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Image.network(
                    imageUrl,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                left: 32.0, right: 32.0, top: 8.0, bottom: 8.0),
                            child: Text(
                              title,
                              style: const TextStyle(
                                  fontSize: 36, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              left: 32.0,
                              right: 32.0,
                              top: 8.0,
                              bottom: 12.0,
                            ),
                            alignment: Alignment.topLeft,
                            child: Text(
                              description,
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              left: 32.0,
                              right: 32.0,
                              top: 4.0,
                              bottom: 12.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Badge(
                                  toAnimate: false,
                                  shape: BadgeShape.square,
                                  badgeColor: Colors.blue,
                                  borderRadius: BorderRadius.circular(8),
                                  badgeContent: Text(
                                    status,
                                    style: const TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Text(
                                  date,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.grey,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 48.0,
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              left: 32.0,
                              right: 32.0,
                              top: 8.0,
                              bottom: 12.0,
                            ),
                            child: Text(
                              "For more information visit: $link",
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
