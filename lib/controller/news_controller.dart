import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class NewsController extends GetxController {
  TextEditingController searchController = TextEditingController();

  // Sample data for the cards
  final List<CardItem> allCardItems = List.generate(
      5,
      (index) => CardItem(
            title: 'Title $index',
            description: 'Description of card $index',
            images: [
              'https://via.placeholder.com/150',
              'https://via.placeholder.com/150',
              'https://via.placeholder.com/150'
            ],
          ));

  var cardItems = <CardItem>[].obs;

  List<dynamic>? newsData = [];

  @override
  void onInit() async {
    super.onInit();
    cardItems.addAll(allCardItems);
    fetchTopHeadlines(); // Initially display all items
  }

  void searchNews() {
    String query = searchController.text.toLowerCase();
    if (query.isEmpty) {
      cardItems.assignAll(allCardItems);
    } else {
      cardItems.assignAll(allCardItems
          .where((item) =>
              item.title.toLowerCase().contains(query) ||
              item.description.toLowerCase().contains(query))
          .toList());
    }
  }

  final Dio _dio = Dio();

  Future<void> fetchTopHeadlines() async {
    const String url =
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=1f6ebb672beb4b30a35f6b6779eb6203';

    try {
      var response = await _dio.get(url);

      if (response.statusCode == 200) {
        newsData = response.data["articles"];
        debugPrint(newsData.toString());
        // The response is already in Map<String, dynamic> format.
      } else {
        // Handle the case where the response status is not 200.
        print('Failed to load top headlines');
      }
    } catch (e) {
      // Handle any exceptions that might occur.
      print('Error occurred: $e');
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}

class CardItem {
  final String title;
  final String description;
  final List<String> images;

  CardItem({
    required this.title,
    required this.description,
    required this.images,
  });
}
