import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:webview_flutter/webview_flutter.dart';
import 'simpan.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:convert';
import 'infors.dart';

import 'package:flutter_share/flutter_share.dart';
import 'hitung.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Health News ID',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Health News ID'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List dataJSON=[];
  List dataJSON2=[];
  List tampilRajal=[];
  List unitJSON=[];
  var kelompok=[];
  List list = [];
  List listValues = []; // This list only keeps values
  List listKeys = [];
  List linkberita =[];
  List gambarBerita=[];

  int _selectedIndex = 0;
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
      if (index==0){
        print("Berita");
      } else if (index==1){
        print("Hitung");
        Navigator.push(
          context,
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) => Hitung(),
              transitionDuration: Duration(seconds: 0),
            ),
        );
        

      }else if (index==2){
        print("RS");
        Navigator.push(
          context,
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) => InfoRSScreen(),
              transitionDuration: Duration(seconds: 0),
            ),
        );
       

      }
    });
  }

  List list2 = [];
  List listValues2 = []; // This list only keeps values
  List listKeys2 = [];
  List Matamu2 =[];
  String? urlgambar='';
  final ScrollController _scrollController = ScrollController();
  Future<dynamic> ambildata()async{
    String urlAPI="https://newsapi.org/v2/top-headlines?country=id&category=health&apiKey=9af25ed49b7a498f85de819e2c1602af";



    var response = await http.get(Uri.parse(
        urlAPI)
    );
    var hasil = json.decode(response.body)['articles'];



    //print(inPatientJson);
    dataJSON = hasil;
    print("ini hasil");
    print(dataJSON[0]["title"]);


/*
    Map<String, List <dynamic>> unitranap={};


    for(var i in dataJSON){
      unitranap.update(i["UNITDESC"], (value){
        List temp = List.from(value);
        temp.add(i["PATNAME"]);
        return temp;
      }, ifAbsent: (){
        return [i["PATNAME"]];
      } );
    }

 */







    setState((){
      dataJSON = hasil;


      Map<String, List <dynamic>> beritaMentah={};
      Map<String, List <dynamic>> beritaLink={};
      Map<String, List <dynamic>> beritaGambar={};


      for(var i in dataJSON){
      beritaMentah.update(i["title"], (value){
      List temp = List.from(value);
      temp.add(itemBerita(i["description"], i["publishedAt"]));
      temp.sort((a,b) => a.no2.compareTo(b.no2));
      return temp;
      }, ifAbsent: (){
      return [itemBerita(i["description"], i["publishedAt"])];
      } );

      }
      for(var i in dataJSON){
        beritaLink.update(i["url"], (value) {
          List temp = List.from(value);
          temp.add(itemBerita(i["description"], i["publishedAt"]));

          return temp;
        }, ifAbsent: (){
          return [itemBerita(i["description"], i["publishedAt"])];
        });
      }
      for(var i in dataJSON){
        var urlToImage = i["urlToImage"];
        if (urlToImage==null){
          urlToImage = 'kosong';
        }
        beritaGambar.update(urlToImage, (value) {
          List temp = List.from(value);
          temp.add(itemBerita(i["description"], i["publishedAt"]));

          return temp;
        }, ifAbsent: (){
          return [itemBerita(i["description"], i["publishedAt"])];
        });
      }

      print(beritaMentah);

      beritaMentah.entries.map((e) => list.add({e.key: e.value})).toList();
      print(list);






      beritaMentah.entries.map((e) => listValues.add(e.value)).toList();
      print(listValues);






      beritaMentah.entries.map((e) => listKeys.add(e.key)).toList();
      print(listKeys);

      beritaLink.entries.map((e) => linkberita.add(e.key)).toList();
      print(linkberita);
      beritaGambar.entries.map((e) => gambarBerita.add(e.key)).toList();
      print(gambarBerita);







    });
  }
  @override
  void initState() {


    ambildata();

  }




  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        children: [
          Expanded(child:
          Scrollbar( isAlwaysShown: true, controller: _scrollController,
            child: ListView.builder(shrinkWrap: true, controller: _scrollController,itemCount: gambarBerita.length,itemBuilder: (BuildContext context, index){
              return Card(margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child:  ListTile(
                    leading: SizedBox(
                      height: 64.0,
                      width: 64.0,
                      child: Image.network(gambarBerita[index]),
                    ),
                    title: Text(listKeys[index], style: const TextStyle(fontFamily: "Roboto", fontWeight: FontWeight.bold)
                    ),
                    subtitle: Text(listValues[index].toString().replaceAll('[', '').replaceAll(']', ''), style: const TextStyle(fontFamily: "Roboto")),
                    onTap: () {
                      urlwebview = linkberita[index];
                      Navigator.push(
                        context,
                          PageTransition(type: PageTransitionType.rightToLeft, child: SecondRoute()),

                      );
                    },
                    onLongPress: () {
                      FlutterShare.share(
                          title: 'Health News ID',
                          text: 'Coba lihat ini deh!',
                          linkUrl: linkberita[index],
                          chooserTitle: 'Health News ID'
                      );
                    },
              )
              );

            }),

          )
          )
        ],
 // This trailing comma makes auto-formatting nicer for build methods.
    ),
        bottomNavigationBar: BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.library_books), label: "Berita"),
        BottomNavigationBarItem(icon: Icon(Icons.calculate), label: "Hitung Kesehatan"),
    BottomNavigationBarItem(icon: Icon(Icons.local_hospital), label: "Rumah Sakit"),
    ],
    currentIndex: _selectedIndex,
    onTap: _onItemTap,
    ),
    );
  }
}
class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health News ID'),
      ),
      body: WebView(
        initialUrl: urlwebview,
      ),
    );
  }
}

class itemBerita {
  String? description='';
  String tgl;


  itemBerita(this.description, this.tgl);

  @override
  String toString() {
    return '${description}  ${tgl.replaceAll('Z', '').replaceAll('T', ' ')}';
  }
}