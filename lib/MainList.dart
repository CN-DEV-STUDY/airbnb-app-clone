import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<MainList> fetchMainList() async {
  final response = await http
      .get(Uri.parse("http://localhost:8080/mainList"));

  print("please");

  if(response.statusCode == 200) {
    var responseData = jsonDecode(utf8.decode(response.bodyBytes));
    // List<Category> categoryList = List<Category>.from(i.first.map((model) => Category.fromJson(model)));
    // List<Accomodation> accomodationList = List<Accomodation>.from(i.last.map((model) => Category.fromJson(model)));

    List<Category> categoryList = [];
    for(var singleCategory in responseData['categoryList']) {
      Category category = Category(
        id: singleCategory['id'],
        name: singleCategory['name'],
        url: singleCategory['url']
      );
      categoryList.add(category);
    }

    List<Accomodation> accomodationList = [];

    MainList mainList = MainList(categoryList: categoryList, accomodationList: accomodationList);
    return mainList;
  } else {
    throw Exception('Failed to load category');
  }
}

class MainList {
  final List<Category> categoryList;
  final List<Accomodation> accomodationList;


  const MainList({
    required this.categoryList,
    required this.accomodationList
  });

  factory MainList.fromJson(Map<String, dynamic> json) {
    return MainList(
        categoryList: json['categoryList'],
        accomodationList: json['accomodationList']
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


class Accomodation {
  final int id;
  final String place;
  final String title;
  final String addr;
  final String lat;
  final String lng;
  final String subTitle;
  final int filterMaxPerson;
  final int filterBedroom;
  final int filterBed;
  final int filterBathroom;
  final int price;
  final String hostNotice;
  final String locInfo;
  final bool superHost;

  const Accomodation({
    required this.id,
    required this.place,
    required this.title,
    required this.addr,
    required this.lat,
    required this.lng,
    required this.subTitle,
    required this.filterMaxPerson,
    required this.filterBedroom,
    required this.filterBed,
    required this.filterBathroom,
    required this.price,
    required this.hostNotice,
    required this.locInfo,
    required this.superHost

  });

  factory Accomodation.fromJson(Map<String, dynamic> json) {
    return Accomodation(
        id: json['id'],
        place: json['place'],
        title: json['title'],
        addr: json['addr'],
        lat: json['lat'],
        lng: json['lng'],
        subTitle: json['subTitle'],
        filterMaxPerson: json['filterMaxPerson'],
        filterBedroom: json['filterBedroom'],
        filterBed: json['filterBed'],
        filterBathroom: json['filterBathroom'],
        price: json['price'],
        hostNotice: json['hostNotice'],
        locInfo: json['locInfo'],
        superHost: json['superHost']
    );
  }
}