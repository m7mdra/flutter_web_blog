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
    return Container(
      color: Colors.red,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
          child: Text(
        MediaQuery.of(context).size.toString(),
        style: Theme.of(context).textTheme.display4,
      )),
    );
  }
}

class SmallScreenHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
    return ListView.builder(
      itemCount: navigationItems.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          trailing: Icon(navigationItems[index].icon),
          title: Text(navigationItems[index].title),
        );
      },
    );
  }
}
