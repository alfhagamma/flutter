import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiApp extends StatefulWidget{

  final String domain;
  final String route;

  const ApiApp({super.key, required this.domain, required this.route});

  @override
  State<ApiApp> createState() => _ApiAppState();
}

class _ApiAppState extends State<ApiApp> {

  late List <Widget>dataJson = [];

  @override
  void initState() {
    super.initState();
    if(mounted) {
      fetchData(widget.domain, widget.route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: dataJson,
    );
  }

  void fetchData(String domain, String route) {
    var url = Uri.https(domain, route);
    http.get(url)
    .then((response) {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        dataJson = data['results'];
        setState(() {});
      }
    })
    .catchError( (e) {
        throw Exception('Failed to load data');
    });
  }
}
      