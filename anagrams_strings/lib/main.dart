import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Anagrams '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
String text1="debit Card";
String text2="bad credit";

String text3="punshmints";
String text4="nine thumps";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              (chechAnagramsStrings(text1,text2))? '$text1 $text2 are anagram strings':'$text1 $text2 are not anagram strings',
            ),
            Text(
              (chechAnagramsStrings(text3,text4))? '$text3 $text4 are anagram strings':'$text3 $text4 are not anagram strings',
            ),
          ],
        ),
      ), //
    );
  }

  bool chechAnagramsStrings(String str1,String str2){

    str1 = str1.toLowerCase();
    str2 = str2.toLowerCase();

    if (str1.length != str2.length) {
     return false;
    }
    else {
      List<String> list1,list2;
      for(int i;i<=str1.length;i++){
        list1.add(str1[i]);
        list2.add(str2[i]);

         list1.sort();
         list2.sort();
        if(list1==list2)
          return true;
        else return false;
      }

    }
    }

}
