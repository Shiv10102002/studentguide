import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:studentguide/constant.dart';
import 'package:studentguide/controller/news_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:studentguide/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class LatestUpdateScreen extends StatelessWidget {
  LatestUpdateScreen({super.key});
  final NewsController newscontroller = Get.find<NewsController>();

  void _launchURL() async {
    const url = 'https://www.google.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Latest Updates",
          style: darksemibold16.copyWith(fontSize: 18),
          textScaler: TextScaler.noScaling,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // TextField(
              //   controller: newscontroller.searchController,
              //   decoration: InputDecoration(
              //     // suffixIcon: Icon(
              //     //   Icons.search,
              //     //   color: Theme.of(context).iconTheme.color,
              //     // ),

              //     contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              //     prefixIconConstraints: const BoxConstraints(
              //         minHeight: 25, maxHeight: 25, minWidth: 25, maxWidth: 65),
              //     prefixIcon: Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 15),
              //       child: SvgPicture.asset(
              //         'assets/icons/searchnormal.svg',
              //         height: 20,
              //         width: 20,
              //         colorFilter:
              //             const ColorFilter.mode(primaryColor, BlendMode.srcIn),
              //       ),
              //     ),
              //     hintText: 'Search...',
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(7),
              //       borderSide: BorderSide.none,
              //     ),
              //     enabledBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(7),
              //       borderSide: BorderSide.none,
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderSide: BorderSide.none,
              //       borderRadius: BorderRadius.circular(7),
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: newscontroller.newsData!.length,
                  itemBuilder: (context, index) {
                    final cardItem = newscontroller.newsData![index];
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
                                width: MediaQuery.of(context).size.width,
                                child: Image.network(
                                  'https://via.placeholder.com/150',
                                  fit: BoxFit.cover,
                                )

                                // CarouselSlider(
                                //   options: CarouselOptions(
                                //     height: 150.0,
                                //     enlargeCenterPage: true,
                                //     autoPlay: true,
                                //   ),
                                //   items: cardItem.images.map((image) {
                                //     return Builder(
                                //       builder: (BuildContext context) {
                                //         return Container(
                                //           width:
                                //               MediaQuery.of(context).size.width,
                                //           margin: const EdgeInsets.symmetric(
                                //               horizontal: 5.0),
                                //           decoration: const BoxDecoration(
                                //             color:
                                //                 Color.fromARGB(255, 7, 255, 189),
                                //           ),
                                //           child: CachedNetworkImage(
                                //             imageUrl: image,
                                //             fit: BoxFit.cover,
                                //             errorWidget: (context, url, error) =>
                                //                 const Icon(Icons.error),
                                //           ),
                                //         );
                                //       },
                                //     );
                                //   }).toList(),
                                // ),
                                ),
                            const SizedBox(height: 8),
                            Text(cardItem['title'],
                                maxLines: 2,
                                style: Theme.of(context).textTheme.titleSmall),
                            const SizedBox(height: 4),
                            Text(
                              cardItem["publishedAt"],
                              maxLines: 3,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 4),
                            TextButton(
                              onPressed: () async {
                                final Uri url = Uri.parse(cardItem['url']);
                                if (!await launchUrl(
                                  url,
                                  mode: LaunchMode.externalApplication,
                                )) {
                                  throw 'Could not launch $url';
                                }
                                // launch(cardItem['url'].toString());
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
