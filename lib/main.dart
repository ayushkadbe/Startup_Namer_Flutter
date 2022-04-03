import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random(); //Create a variable to store Words

    return const MaterialApp(
      //Inside MATERIAL App directly call RandomWords() to show name list
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
}

//Stateful Class extends Stateful Widget
//StatefulState Class with Logic inside it

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  //Add _suggestions list for saving words
  //add _biggerfonts for font
  final _suggestions = <WordPair>[];
  final _biggerfonts = const TextStyle(fontSize: 18.0);

//Add a ListView.builder widget to the build method of the _RandomWordsState class:
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Name Generator'),
      ),
      body: ListView.builder(
        //List View
        padding: const EdgeInsets.all(16.0),

        //itemBuilder > called once/word suggested pairing >PLACES word to LIST TITLE
        itemBuilder: (context, i) {
          //i = rows -may be odd or even
          if (i.isOdd) return const Divider();

          //i ~/ 2 divides i by 2 and returns integer as result > calcs actual no of WORD PAIRINGS
          //like 1,2,3,4,5 words pairing become 1,1, 2,2,3,3
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          //LISTTITLE shows the SUGGESTIONS of WordPairing in LIST with custom fonts & case
          return ListTile(
            title: Text(
              _suggestions[index].asPascalCase,
              style: _biggerfonts,
            ),
          );
        },
      ),
    );
  }
}
