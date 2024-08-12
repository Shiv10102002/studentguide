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

  @override


  
  void onInit() {
    super.onInit();
    cardItems.addAll(allCardItems); // Initially display all items
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
