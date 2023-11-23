// Favorites.dart
import 'package:flutter/material.dart';
import 'FavoriteBarbers.dart';

class PopularB extends StatefulWidget {
  @override
  _PopularBState createState() => _PopularBState();
}

class _PopularBState extends State<PopularB> {
  final List<String> popularBarbersImages = [
    "https://www.nme.com/wp-content/uploads/2021/04/zild-benitez-credit-shaira-luna@2000x1270.jpg",
    "https://i.scdn.co/image/ab6761610000e5ebc4902f080d3620b3e6da80c3",
    "https://www.thepinknews.com/wp-content/uploads/2023/04/Frank-Ocean-pulls-out-of-Coachella-weekend-two.-Getty.jpg?w=1024",
    "https://nationaltoday.com/wp-content/uploads/2022/10/456840979-min-1200x834.jpg",
    "https://highprofiles.info/wp-content/uploads/2016/04/Yorke-main-900x600.jpg",
  ];

  List<bool> isFavoriteList = List.generate(5, (index) => false);
  List<bool> isInfoVisibleList = List.generate(5, (index) => false);

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
                  "Popular Barbers",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 500,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: popularBarbersImages.length,
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
                                popularBarbersImages[index],
                                width: double.infinity,
                                height: 500.0,
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
                                              context);
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
                                          isInfoVisibleList[index] =
                                              !isInfoVisibleList[index];
                                        });
                                      },
                                    ),
                                  ],
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
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.attach_money,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          "Average booking price: PHP 12345",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
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
