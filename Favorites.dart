// FavoritesPage.dart
import 'package:flutter/material.dart';
import 'FavoriteBarbers.dart';
import 'FavoriteStyles.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  int _currentIndex = 0;

  Widget _buildSelectedFavoriteSection() {
    String title =
        _currentIndex == 0 ? "Favorite Barbers" : "Favorite Haircuts";

    return _buildFavoriteSection(
      "",
      _currentIndex == 0 ? FavoriteBarbers.favorites : FavoriteStyles.favorites,
      _currentIndex == 0 ? _removeFavoriteBarber : _removeFavoriteStyle,
    );
  }

  Widget _buildFavoriteSection(
    String title,
    List<String> favorites,
    Function(int) removeFavorite,
  ) {
    return Column(
      children: [
        Container(
          color: Theme.of(context)
              .scaffoldBackgroundColor, // Use Scaffold background color
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                color: Theme.of(context)
                    .scaffoldBackgroundColor, // Blend with Scaffold background color
                fontSize: 18,
              ),
            ),
          ),
        ),
        favorites.isEmpty
            ? Container(
                height: 250,
                child: Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 30.0), // Adjust top padding
                    child: Opacity(
                      opacity: 0.7, // Set opacity
                      child: Text(
                        "No Selected Favorites",
                        style: TextStyle(
                          color: Colors.grey, // Set text color to gray
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
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
                                color: Colors.red,
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
        SizedBox(height: 25),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // BottomNavigationBar wrapped in a Container
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            padding: EdgeInsets.symmetric(vertical: 5),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              elevation: 4,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.people),
                  label: 'Barbers',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.face),
                  label: 'Haircuts',
                ),
              ],
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: _buildSelectedFavoriteSection(),
            ),
          ),
        ],
      ),
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
