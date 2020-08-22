import 'dart:math';

import 'package:flutter/material.dart';

class SwipeDeleteDemo extends StatefulWidget {
  @override
  _SwipeDeleteDemoState createState() => _SwipeDeleteDemoState();
}

class _SwipeDeleteDemoState extends State<SwipeDeleteDemo> {
  List<String> companies;
  GlobalKey<RefreshIndicatorState> refreshKey;
  Random r;

  @override
  void initState() {
    super.initState();
    refreshKey = GlobalKey<RefreshIndicatorState>();
    companies = List();
    addCompanies();
  }

  Future<Null> refreshList() async {
    await Future.delayed(Duration(seconds: 1));
    r = Random();
    addRandomCompany();
    return null;
  }

  addRandomCompany() {
    int nextCount = r.nextInt(100);
    setState(() {
      companies.add("Company $nextCount");
    });
  }

  Widget list() {
    return ListView.builder(
      padding: EdgeInsets.all(20.0),
      itemCount: companies.length,
      itemBuilder: (BuildContext context, int index) {
        return row(context, index);
      },
    );
  }

  Widget row(context, index) {
    return Dismissible(
        key: Key(companies[index]),
        // direction: DismissDirection.vertical,
        background: refreshBg(),
        onDismissed: (direction) {
          var company = companies[index];
          showSnackBar(context, company, index);
          removeCompany(index);
        },
        child: Card(
            child: ListTile(
          title: Text(companies[index]),
        )));
  }

  addCompanies() {
    companies.add('Google');
    companies.add('Microsoft');
    companies.add('Facebook');
    companies.add('JP Morgan');
    companies.add('Apple');
  }

  removeCompany(index) {
    setState(() {
      companies.removeAt(index);
    });
  }

  undoDelete(company, index) {
    setState(() {
      companies.insert(index, company);
    });
  }

  showSnackBar(context, company, index) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('$company deleted'),
      action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            undoDelete(company, index);
          }),
    ));
  }

  Widget refreshBg() {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20.0),
      color: Colors.red,
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 300,
      // child: RefreshIndicator(
      //     key: refreshKey,
      //     onRefresh: () async {
      //       await refreshList();
      //     },
      //     child: list()),
      child: list(),
    );
  }
}
