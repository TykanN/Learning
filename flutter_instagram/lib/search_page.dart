import 'package:flutter/material.dart';
import 'package:flutter_instagram/create_page.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePage()));
        },
        child: Icon(Icons.create),
        backgroundColor: Colors.blue,
      ),
    );
  }

 Widget _buildBody() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      childAspectRatio: 1.0,
      mainAxisSpacing: 1,
      crossAxisSpacing: 1
        ),
        itemCount: 5,
        itemBuilder: (context, index) {
          return _buildListItem(context, index);
        });
 }

  Widget _buildListItem(BuildContext context, int index) {
    return Image.network('https://tykann.github.io/img/profile.jpg', fit: BoxFit.cover,);
  }
}

