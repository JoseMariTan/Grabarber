import 'package:flutter/material.dart';

class FavoriteBarbers extends StatefulWidget {
  static List<String> favorites = [];

  @override
  _FavoriteBarbersState createState() => _FavoriteBarbersState();
}

class _FavoriteBarbersState extends State<FavoriteBarbers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorite Barbers",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF212121),
      ),
      body: Container(
        color: Color(0xFFE0E0E0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                FavoriteBarbers.favorites.isEmpty
                    ? Center(
                        child: Text(
                          "You currently have no Favorite Barbers",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : Container(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: FavoriteBarbers.favorites.length,
                          itemBuilder: (context, index) {
                            return _buildFavoriteItem(
                                FavoriteBarbers.favorites[index]);
                          },
                        ),
                      ),
                SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFavoriteItem(String image) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Image.network(
              image,
              width: 300.0,
              height: 200.0,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                icon: Icon(
                  Icons.remove_circle,
                  color: Colors.black,
                ),
                onPressed: () {
                  _removeFavorite(image);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _removeFavorite(String image) {
    setState(() {
      FavoriteBarbers.favorites.remove(image);
    });
  }
}
