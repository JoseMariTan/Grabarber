import 'dart:math';
import 'package:flutter/material.dart';
import 'FavoriteStyles.dart';

class TrendingH extends StatefulWidget {
  @override
  _TrendingHState createState() => _TrendingHState();
}

class _TrendingHState extends State<TrendingH> {
  final List<String> trendingHairstylesImages = [
    "https://www.dmarge.com/wp-content/uploads/2021/05/mens-taper-fade-hairstyles-feature.jpg",
    "https://mcdn.coolmate.me/image/August2022/toc-two-block-nam-3.jpg",
    "https://www.chapsandco.com/ae/wp-content/uploads/sites/12/2023/02/tapered.jpg",
    "https://images.tokopedia.net/img/KRMmCm/2022/9/22/4e4dd715-6b1c-4e69-a3c6-c27dd44f27fa.jpg",
  ];

  List<bool> isFavoriteList = List.generate(4, (index) => false);
  List<bool> isInfoClickedList = List.generate(4, (index) => false);
  List<bool> isAddedToFavoritesList = List.generate(4, (index) => false);
  List<double> ratings = List.generate(4, (index) => 4 + Random().nextDouble());
  List<String> hairstyleNames = [
    "Taper",
    "Two Block",
    "Buzzcut",
    "French Crop"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Trending Hairstyles",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF212121), // Match the color scheme
      ),
      body: Container(
        color: Color(0xFFE0E0E0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: trendingHairstylesImages.length,
                  itemBuilder: (context, index) {
                    return _buildHairstyleItem(index);
                  },
                ),
              ),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHairstyleItem(int index) {
    return GestureDetector(
      onTap: () {
        // Handle tap on the image
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                width: double.infinity,
                height: 200.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color(0xFF212121),
                    width: 4,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    trendingHairstylesImages[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF212121),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        iconSize: 20,
                        icon: Icon(
                          Icons.star,
                          color: isFavoriteList[index]
                              ? Colors.yellow
                              : Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            isFavoriteList[index] = !isFavoriteList[index];
                            _handleFavorite(index);
                            _showMessage(
                              isFavoriteList[index]
                                  ? 'Added to Favorites'
                                  : 'Removed from Favorites',
                              context,
                            );
                          });
                        },
                      ),
                      IconButton(
                        iconSize: 20,
                        icon: Icon(
                          Icons.info,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            isInfoClickedList[index] =
                                !isInfoClickedList[index];
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              if (isInfoClickedList[index])
                Positioned(
                  bottom: 8.0,
                  left: 8.0,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 16,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "${ratings[index].toStringAsFixed(1)}/5",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Hairstyle: ${hairstyleNames[index]}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              if (isAddedToFavoritesList[index])
                Positioned(
                  top: 50,
                  left: 50,
                  child: Container(
                    width: 200,
                    height: 50,
                    color: Colors.black.withOpacity(0.7),
                    child: Center(
                      child: Text(
                        "Added to Favorites",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleFavorite(int index) {
    String hairImage = trendingHairstylesImages[index];
    if (isFavoriteList[index]) {
      // Add to favorites
      FavoriteStyles.favorites.add(hairImage);
    } else {
      // Remove from favorites
      FavoriteStyles.favorites.remove(hairImage);
    }
  }

  void _showMessage(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 1),
      ),
    );
  }
}
