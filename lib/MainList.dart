import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<MainList> fetchMainList() async {
  final response = await http
      .get(Uri.parse("http://13.125.154.241:8080/mainList"));

  if(response.statusCode == 200) {
    var responseData = jsonDecode(utf8.decode(response.bodyBytes));

    List<Category> categoryList = [];
    for(var singleCategory in responseData['categoryList']) {
      Category category = Category(
        id: singleCategory['id'],
        name: singleCategory['name'],
        url: singleCategory['url']
      );
      categoryList.add(category);
    }

    List<Home> homeList = [];
    for(var singleHome in responseData['homeList']) {
      Home home = Home(
        id: singleHome['id'],
        place: singleHome['place'],
        addr: singleHome['addr'],
        price: singleHome['price'],
        url: singleHome['url']
      );
      homeList.add(home);
    }

    MainList mainList = MainList(categoryList: categoryList, homeList: homeList);
    return mainList;
  } else {
    throw Exception('Failed to load category');
  }
}

class MainList {
  final List<Category> categoryList;
  final List<Home> homeList;


  const MainList({
    required this.categoryList,
    required this.homeList
  });

  factory MainList.fromJson(Map<String, dynamic> json) {
    return MainList(
        categoryList: json['categoryList'],
        homeList: json['homeList']
    );
  }
}


class Category {
  final int id;
  final String name;
  final String url;

  const Category({
    required this.id,
    required this.name,
    required this.url
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        id: json['id'],
        name: json['name'],
        url: json['url']
    );
  }
}


class Home {
  final int id;
  final String place;
  final String addr;
  final int price;
  final String url;

  const Home({
    required this.id,
    required this.place,
    required this.addr,
    required this.price,
    required this.url
  });

  factory Home.fromJson(Map<String, dynamic> json) {
    return Home(
        id: json['id'],
        place: json['place'],
        addr: json['addr'],
        price: json['price'],
        url: json['url']
    );
  }
}