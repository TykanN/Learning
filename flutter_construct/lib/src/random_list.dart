import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_construct/src/saved.dart';
import 'bloc/bloc.dart';

class RandomList extends StatefulWidget {
  @override
  _RandomListState createState() => _RandomListState();
}

class _RandomListState extends State<RandomList> {
  final List<WordPair> _suggestions = <WordPair>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Naming App'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.list),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => SavedList()));
              },
            )
          ],
        ),
        body: _buildList());
  }

  Widget _buildList() {
    return StreamBuilder<Set<WordPair>>(
        stream: bloc.savedStream,
        builder: (context, snapshot) {
          return ListView.builder(
            itemBuilder: (context, index) {
              //0, 2, 4, 6 ... = real items
              //1, 3, 5, 7 ... = dividers
              if (index.isOdd) {
                return Divider();
              }

              var realIndex = index ~/ 2;

              if (realIndex >= _suggestions.length) {
                _suggestions.addAll(generateWordPairs().take(10));
              }
              return _buildRow(snapshot.data, _suggestions[realIndex]);
            },
          );
        });
  }

  Widget _buildRow(Set<WordPair> saved, WordPair pair) {
    final bool alreadySaved = saved == null ? false : saved.contains((pair));
    return ListTile(
      title: Text(
        pair.asPascalCase,
        textScaleFactor: 1.5,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: Colors.pink,
      ),
      onTap: () {
        bloc.addOrRemoveFromSavedList(pair);
      },
    );
  }
}
