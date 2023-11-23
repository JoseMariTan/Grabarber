// TrendingH.dart
import 'package:flutter/material.dart';
import 'FavoriteStyles.dart';

class TrendingH extends StatefulWidget {
  @override
  _TrendingHState createState() => _TrendingHState();
}

class _TrendingHState extends State<TrendingH> {
  final List<String> trendingHairstylesImages = [
    "https://lovehairstyles.com/wp-content/uploads/2017/07/best-mens-hairstyles-ryan-reynolds-683x1024.jpg",
    "https://menshairstyletips.com/wp-content/uploads/2020/11/Korean-Men-Haircut.jpg?resize=200%2C600",
    "https://www.fashionbeans.com/wp-content/uploads/2021/11/Long-Hair-Undercut-and-Fade_longhairstylemen.jpg?resize=200%2C600",
    "https://cdn.wisebarber.com/wisebarber/images/zw9hmzih431h1zr.jpg?width=432&height=576&aspect_ratio=432%3A576&quality=90",
  ];

  List<bool> isFavoriteList = List.generate(4, (index) => false);

  List<bool> isInfoClickedList = List.generate(4, (index) => false);

  List<bool> isAddedToFavoritesList = List.generate(4, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Grabarber",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF212121), // Match the color scheme
      ),
      body: Container(
        color: Color(0xFFE0E0E0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Trending Hairstyles",
                  style: TextStyle(
                    color: Colors.black, // Updated text color
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 600,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: trendingHairstylesImages.length,
                  itemBuilder: (context, index) {
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
                              Image.network(
                                trendingHairstylesImages[index],
                                width: 1000.0,
                                height: 600.0,
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      iconSize: 40,
                                      icon: Icon(
                                        Icons.star,
                                        color: isFavoriteList[index]
                                            ? Colors.yellow
                                            : Colors.white,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          isFavoriteList[index] =
                                              !isFavoriteList[index];
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
                                      iconSize: 40,
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
                              if (isInfoClickedList[index])
                                Positioned(
                                  top: 50,
                                  right: 50,
                                  child: Container(
                                    width: 150,
                                    height: 80,
                                    color: Colors.black.withOpacity(0.7),
                                    child: Center(
                                      child: Text(
                                        "Info",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
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
