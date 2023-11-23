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
                        height: 500,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: FavoriteBarbers.favorites.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    Image.network(
                                      FavoriteBarbers.favorites[index],
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
                                        _removeFavorite(index);
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
            ),
          ),
        ),
      ),
    );
  }

  void _removeFavorite(int index) {
    setState(() {
      FavoriteBarbers.favorites.removeAt(index);
    });
  }
}
