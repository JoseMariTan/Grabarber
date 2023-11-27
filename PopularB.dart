import 'dart:math';
import 'package:flutter/material.dart';
import 'FavoriteBarbers.dart';

class PopularB extends StatefulWidget {
  @override
  _PopularBState createState() => _PopularBState();
}

class _PopularBState extends State<PopularB> {
  final List<String> popularBarbersImages = [
    "https://www.nme.com/wp-content/uploads/2021/04/zild-benitez-credit-shaira-luna@2000x1270.jpg",
    "https://musicfeeds.com.au/wp-content/uploads/sites/7/2021/12/lordefallen.jpeg",
    "https://www.thepinknews.com/wp-content/uploads/2023/04/Frank-Ocean-pulls-out-of-Coachella-weekend-two.-Getty.jpg?w=1024",
    "https://nationaltoday.com/wp-content/uploads/2022/10/456840979-min-1200x834.jpg",
    "https://www.nme.com/wp-content/uploads/2022/10/shnti-twitter@2000x1270.jpg",
  ];

  List<bool> isFavoriteList = List.generate(5, (index) => false);
  List<bool> isInfoVisibleList = List.generate(5, (index) => false);
  List<double> ratings = List.generate(5, (index) => 4 + Random().nextDouble());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Popular Barbers",
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
                  itemCount: popularBarbersImages.length,
                  itemBuilder: (context, index) {
                    return _buildBarberItem(index);
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

  Widget _buildBarberItem(int index) {
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
                    popularBarbersImages[index],
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
                            isInfoVisibleList[index] =
                                !isInfoVisibleList[index];
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              if (isInfoVisibleList[index])
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
                              "Avg Rating: ${ratings[index].toStringAsFixed(1)}/5",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
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
    String barberImage = popularBarbersImages[index];
    if (isFavoriteList[index]) {
      // Add to favorites
      FavoriteBarbers.favorites.add(barberImage);
    } else {
      // Remove from favorites
      FavoriteBarbers.favorites.remove(barberImage);
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
