import 'package:flutter/material.dart';
import 'package:rest_api/networkhelper.dart';
import 'package:rest_api/post.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Rest API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rest API sample'),
      ),
      body: Center(
//      FutureBuilder helps to deal with futures and their response cycle
//      FutureBuilder has 2 essential properties.
//      future : takes a future object builder : takes a function with context and snapshot
//      It also returns a widget
//      context : contains the current context
//      snapshot : contains the response from the Futures response cycle

//      ListView.builder takes an ItemCount that we provide through snapshot.data.number
//      (number of people in space)
//      This ItemCount is the number of Items that will be in the List.
//      ItemBuilder : this tells Flutter how each item in the list will be built. It
//      takes two arguments:
//      context : the current context and index : the current index of the item being built
//      In the ItemBuilder, we return a ListTile with the title having the name
//       and the subtitle having the craft of every person currently in space.

        child: FutureBuilder<Post>(
          future: getPost(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data.number,
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text(snapshot.data.people[index]['name']),
                    subtitle: Text(snapshot.data.people[index]['craft'],),
                  );
                }
              );
            } else if (snapshot.hasError){
              return Text("${snapshot.error}");
            }

//      By default, show a loading spinner.
          return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
