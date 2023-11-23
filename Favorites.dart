// FavoritesPage.dart
import 'package:flutter/material.dart';
import 'FavoriteBarbers.dart';
import 'FavoriteStyles.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFE0E0E0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                // Favorite Barbers Section
                _buildFavoriteSection(
                  "Favorite Barbers",
                  FavoriteBarbers.favorites,
                  _removeFavoriteBarber,
                ),
                SizedBox(height: 25),
                // Favorite Styles Section
                _buildFavoriteSection(
                  "Favorite Hairstyles",
                  FavoriteStyles.favorites,
                  _removeFavoriteStyle,
                ),
                SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFavoriteSection(
    String title,
    List<String> favorites,
    Function(int) removeFavorite,
  ) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        favorites.isEmpty
            ? Center(
                child: Text(
                  "You currently have no $title",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            : Container(
                height: 500,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: favorites.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Image.network(
                              favorites[index],
                              width: double.infinity,
                              height: 500.0,
                              fit: BoxFit.cover,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.remove_circle,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                removeFavorite(index);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
      ],
    );
  }

  void _removeFavoriteBarber(int index) {
    setState(() {
      FavoriteBarbers.favorites.removeAt(index);
    });
  }

  void _removeFavoriteStyle(int index) {
    setState(() {
      FavoriteStyles.favorites.removeAt(index);
    });
  }
}
