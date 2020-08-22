import 'package:ServerPage/ServerListView.dart';
import 'package:ServerPage/SwipeToDelete.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ServerPage extends StatefulWidget {
  @override
  _ServerPageState createState() => _ServerPageState();
}

class _ServerPageState extends State<ServerPage> {
  int _current = 0;
  List<String> serverNames = ["Server1", "Server2", "Server3"];
  List<String> serverIP = [
    "192.168.99.101",
    "192.168.99.102",
    "192.168.99.103"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                'Select A Server',
                style: TextStyle(
                    color: Color(0xff7f8c8d),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 100.0),
                // padding: EdgeInsets.symmetric(horizontal: 50),,
                width: 200,
                height: 200,
                child: Image.asset(
                  'assets/images/p1.png',
                  fit: BoxFit.fill,
                )),
            // Container(
            //   height: 100,
            //   child: ListView.builder(
            //       itemCount: 3,
            //       scrollDirection: Axis.horizontal,
            //       itemBuilder: (context, i) {
            //         return Container(
            //           color: Colors.amber,
            //           width: MediaQuery.of(context).size.width,
            //           margin: EdgeInsets.symmetric(horizontal: 20.0),
            //           child: Text(serverNames[i]),
            //         );
            //       }),

            // ),
            // CarouselSlider(
            //   options: CarouselOptions(
            //     height: 100.0,
            //     aspectRatio: 16 / 9,
            //     viewportFraction: 0.8,
            //     initialPage: 0,
            //     enableInfiniteScroll: false,
            //     reverse: false,
            //     //autoPlay: true,
            //     //autoPlayInterval: Duration(seconds: 3),
            //     //autoPlayAnimationDuration: Duration(milliseconds: 800),
            //     //autoPlayCurve: Curves.fastOutSlowIn,
            //     enlargeCenterPage: true,
            //     scrollDirection: Axis.horizontal,
            //   ),
            //   items: serverNames.map((i) {
            //     return Builder(
            //       builder: (BuildContext context) {
            //     return Container(
            //         width: MediaQuery.of(context).size.width,
            //         margin: EdgeInsets.symmetric(horizontal: 5.0),
            //         decoration: BoxDecoration(color: Colors.amber),
            //         child: Text(
            //           '$i',
            //           style: TextStyle(fontSize: 16.0),
            //         ));
            //   },
            // );
            //   }).toList(),
            // )

            // // CarouselSlider.builder(
            // //   itemCount: serverNames.length,
            // //   itemBuilder: (BuildContext context, int itemIndex) => Container(
            // //     child: Container(
            // //       // color: Colors.amber,
            // //       //width: MediaQuery.of(context).size.width * 0.8,
            // //       //decoration: BoxDecoration(color: Colors.amber),
            // //       child: Center(
            // //         child: Column(
            // //           children: <Widget>[
            // //             Container(
            // //               width: 70,
            // //               height: 70,
            // //               child: Image.asset(
            // //                 'assets/images/p2.jpeg',
            // //               ),
            // //             ),
            // //             Text(
            // //               serverNames[itemIndex],
            // //               style: TextStyle(
            // //                   fontSize: 15,
            // //                   fontWeight: FontWeight.bold,
            // //                   color: Color(0xff95a5a6)),
            // //             ),
            // //             Text(
            // //               serverIP[itemIndex],
            // //               style: TextStyle(
            // //                   fontSize: 15,
            // //                   fontWeight: FontWeight.bold,
            // //                   color: Color(0xff7f8c8d)),
            // //             ),
            // //           ],
            // //         ),
            // //       ),
            // //     ),
            // //   ),
            // //   options: CarouselOptions(
            // //     height: 150.0,
            // //     aspectRatio: 1 / 2,
            // //     viewportFraction: 0.4,
            // //     initialPage: 1,
            // //     enableInfiniteScroll: false,
            // //     reverse: false,

            // //     //autoPlay: true,
            // //     //autoPlayInterval: Duration(seconds: 3),
            // //     //autoPlayAnimationDuration: Duration(milliseconds: 800),
            // //     //autoPlayCurve: Curves.fastOutSlowIn,
            // //     enlargeCenterPage: true,
            // //     scrollDirection: Axis.horizontal,
            // //   ),
            // // ),

            // Container(
            //   decoration: BoxDecoration(boxShadow: [
            //     BoxShadow(color: Colors.green, blurRadius: 20.0)
            //   ]),
            //   child: IconButton(
            //       color: Colors.white,
            //       icon: Icon(Icons.add),
            //       onPressed: () {
            //         print('Item added...');
            //       }),
            // ),

            // // // SwipeDeleteDemo(),

            LimitedBox(maxHeight: 140, maxWidth: 200, child: ServerListView()),
          ],
        ),
      ),
    );
  }
}
