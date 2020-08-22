import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ServerListView extends StatefulWidget {
  @override
  _ServerListViewState createState() => _ServerListViewState();
}

class _ServerListViewState extends State<ServerListView> {
  List<String> serverNames;
  List<String> serverIP;

  @override
  void initState() {
    super.initState();
    serverNames = List();
    serverIP = List();
    addServer();
  }

  addServer() {
    serverNames.add('Server1');
    serverNames.add('Server2');
    serverNames.add('Server3');
    serverIP.add("192.168.99.101");
    serverIP.add("192.168.99.102");
    serverIP.add("192.168.99.103");
  }

  removeServer(index) {
    setState(() {
      serverIP.removeAt(index);
      serverNames.removeAt(index);
    });
  }

  undoDelete(index, server) {
    setState(() {
      serverIP.insert(index, server);
      serverNames.insert(index, server);
    });
  }

  showSnackBar(context, server, index) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('$server Deleted'),
      action: SnackBarAction(
          label: "UNDO",
          onPressed: () {
            undoDelete(index, server);
          }),
    ));
  }

  Widget refreshBg() {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: 10.0),
      color: Colors.red,
      child: Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }

  myContiner() {
    return Expanded(
      child: CarouselSlider.builder(
        itemCount: serverNames.length,
        itemBuilder: (BuildContext context, int itemIndex) => Container(
          child: Dismissible(
            direction: DismissDirection.vertical,
            key: Key(serverIP[itemIndex]),
            onDismissed: (direction) {
              var server = serverNames[itemIndex];
              showSnackBar(context, server, itemIndex);
              removeServer(itemIndex);
            },
            background: refreshBg(),
            child: Container(
              // color: Colors.amber,
              //width: MediaQuery.of(context).size.width * 0.8,
              //decoration: BoxDecoration(color: Colors.amber),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 70,
                      height: 70,
                      child: Image.asset(
                        'assets/images/p2.jpeg',
                      ),
                    ),
                    Text(
                      serverNames[itemIndex],
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff95a5a6)),
                    ),
                    Text(
                      serverIP[itemIndex],
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff7f8c8d)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        options: CarouselOptions(
          height: 150.0,
          aspectRatio: 1 / 2,
          viewportFraction: 0.4,
          initialPage: 1,
          enableInfiniteScroll: false,
          reverse: false,

          //autoPlay: true,
          //autoPlayInterval: Duration(seconds: 3),
          //autoPlayAnimationDuration: Duration(milliseconds: 800),
          //autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return myContiner();
  }
}
