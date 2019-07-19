import 'package:flutter_web/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          if (MediaQuery.of(context).size.width > 600) {
            return LargeScreenHome();
          } else {
            return SmallScreenHome();
          }
        },
      ),
    );
  }
}

class LargeScreenHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Flexible(child: DrawerNavigation()),
          Container(color: Colors.red,),
          Container(color: Colors.black,),

        ],
      ),
    );
  }
}

class SmallScreenHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: DrawerNavigation(),
    );
  }
}

class NavigationItem {
  final String title;
  final IconData icon;

  NavigationItem(this.title, this.icon);
}

class DrawerNavigation extends StatelessWidget {
  final List<NavigationItem> navigationItems = [
    NavigationItem("HOME", Icons.home),
    NavigationItem("NEWS", Icons.home),
    NavigationItem("STARTUPS", Icons.home),
    NavigationItem("BUSINESS", Icons.home),
    NavigationItem("EDUCATION", Icons.home),
    NavigationItem("TRAVEL", Icons.home),
    NavigationItem("LIFE", Icons.home),
    NavigationItem("VIDEO", Icons.home),
    NavigationItem("EVENTS", Icons.home),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BackButton(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: navigationItems.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  trailing: Icon(navigationItems[index].icon),
                  title: Text(navigationItems[index].title),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
