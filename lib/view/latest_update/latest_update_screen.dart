import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentguide/constant.dart';
import 'package:studentguide/controller/news_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';

class LatestUpdateScreen extends StatelessWidget {
  LatestUpdateScreen({super.key});
  final NewsController newscontroller = Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                onSubmitted: (val) {
                  newscontroller.searchNews();
                },
                controller: newscontroller.searchController,
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.search,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  hintText: 'Search...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: newscontroller.cardItems.length,
                  itemBuilder: (context, index) {
                    final cardItem = newscontroller.cardItems[index];
                    return Card(
                      elevation: 0,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: Container(
                        // height: 250,
                        width: double.infinity,
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 150,
                              child: CarouselSlider(
                                options: CarouselOptions(
                                  height: 150.0,
                                  enlargeCenterPage: true,
                                  autoPlay: true,
                                ),
                                items: cardItem.images.map((image) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        decoration: const BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 7, 255, 189),
                                        ),
                                        child: CachedNetworkImage(
                                          imageUrl: image,
                                          fit: BoxFit.cover,
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                       
                                      );
                                    },
                                  );
                                }).toList(),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(cardItem.title,
                                maxLines: 2,
                                style: Theme.of(context).textTheme.titleSmall),
                            const SizedBox(height: 4),
                            Text(
                              cardItem.description,
                              maxLines: 3,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 4),
                            TextButton(
                              onPressed: () {
                                // Implement see more functionality
                              },
                              child: const Text(
                                'See more',
                                style: TextStyle(color: primaryColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
