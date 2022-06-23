// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
void main(){
  runApp(const MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Startup Name Generator',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Startup Name Generator'),
        ),
          body: const Center(
            child: NameGen(),
          ),
          ),
    );
  }
}


class NameGen extends StatefulWidget {
  const NameGen({ Key? key }) : super(key: key);

  @override
  State<NameGen> createState() => _NameGenState();
}

class _NameGenState extends State<NameGen> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context,i){
        if (i.isOdd) {
          return const Divider();
        }
        final index = i~/2;
        if (index>=_suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));

        }
        return ListTile(
          title: Text(
            _suggestions[index].asPascalCase,
            style: _biggerFont,
          ),
        );
      }
      );
  }
}