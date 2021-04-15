import 'package:flutter/material.dart';
import 'another.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Traffic App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Traffic App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  TabController _tabController;
  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _tabController = TabController(length: 4, vsync: this) ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: TabBar (
          controller: _tabController,
          tabs: [
            Tab(
              icon: Icon(Icons.home)
            ),
            Tab(
              icon: Icon(Icons.bus_alert),
            ),
            Tab(
              icon: Icon(Icons.map),
            ),
            Tab(
              icon: Icon(Icons.settings),
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [

          //Home Page
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Text( "Welcome",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text( "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14
                  ),
                ),
              ),
            ]
          ),

          // Check in page
          Padding(
            padding: EdgeInsets.all(50.0),
            child: Column(
              children: [
                TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter your location"
                  ),
                ),
                SizedBox(
                  height: 40.0
                ),
                ElevatedButton(
                  child: Text("SHOW ON MAP"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (ctx) => AnotherPage(input: _textController.text)));
                  },
                )
              ],
            ),
          ),

          //Map
          Center(),

          //Settings Page
          Center()
      ]), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
