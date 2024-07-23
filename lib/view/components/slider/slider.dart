import 'package:banner/controller/image_slider_provider.dart';
import 'package:banner/view/components/slider/image_viewer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../const/image_data.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    double height, width;
    Size size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        height: height * .25,
        width: width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            /// Carouse lSlider
            Positioned.fill(
              child: Consumer<ImagesliderProvider>(
                builder: (context, sliderprovider, child) => CarouselSlider(
                  carouselController: sliderprovider.carouselcontoller,

                  /// It's options
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    viewportFraction: 0.8,
                    onPageChanged: (index, reason) {
                      sliderprovider.setCurrent(index);
                    },
                  ),

                  /// Items
                  items: AppData.innerStyleImages.map((imagePath) {
                    return Builder(
                      builder: (BuildContext context) {
                        /// Custom Image Viewer widget
                        return CustomImageViewer.show(
                          context: context,
                          url: imagePath,
                          fit: BoxFit.cover,
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ),

            /// Indicators
            Positioned(
              bottom: height * .02,
              child: Consumer<ImagesliderProvider>(
                builder: (context, sliderprovider, child) {
                  return Row(
                    children: List.generate(
                      AppData.innerStyleImages.length,
                      (index) {
                        bool isSelected = sliderprovider.current == index;
                        return GestureDetector(
                          onTap: () {
                            sliderprovider.carouselcontoller
                                .animateToPage(index);
                          },
                          child: AnimatedContainer(
                            width: isSelected ? 55 : 17,
                            height: 10,
                            margin: EdgeInsets.symmetric(
                                horizontal: isSelected ? 6 : 3),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.deepPurple
                                  : const Color.fromARGB(255, 205, 194, 224),
                              borderRadius: BorderRadius.circular(
                                40,
                              ),
                            ),
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),

            /// Left Icon
            Positioned(
              left: 11,
              child: Consumer<ImagesliderProvider>(
                builder: (context, sliderprovider, child) {
                  return CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 205, 194, 224),
                    child: IconButton(
                      onPressed: sliderprovider.previous,
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                      ),
                    ),
                  );
                },
              ),
            ),

            /// Right Icon
            Positioned(
              right: 11,
              child: Consumer<ImagesliderProvider>(
                builder: (context, sliderprovider, child) {
                  return CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 205, 194, 224),
                    child: IconButton(
                      onPressed: sliderprovider.next,
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
