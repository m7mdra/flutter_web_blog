import 'dart:math';

import 'package:flutter_web/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
          Flexible(
            child: ArticlesPage(),
            flex: 2,
          ),
          Flexible(
            child: Container(
              color: Colors.black,
            ),
            flex: 3,
          ),
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
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: DrawerNavigation(),
      body: ArticlesPage(),
    );
  }
}

class NavigationItem {
  final String title;
  final IconData icon;

  NavigationItem(this.title, this.icon);
}

class Article {
  final String title;
  final String author;
  final String time;

  Article(this.title, this.author, this.time);
}

class ArticlesPage extends StatelessWidget {
  final List<Article> articles = [
    Article("New Startup idea", "Mega", "${Random().nextInt(24)} HOURS AGO"),
    Article("New Startup idea", "Mega", "${Random().nextInt(24)} HOURS AGO"),
    Article("New Startup idea", "Mega", "${Random().nextInt(24)} HOURS AGO"),
    Article("New Startup idea", "Mega", "${Random().nextInt(24)} HOURS AGO"),
    Article("New Startup idea", "Mega", "${Random().nextInt(24)} HOURS AGO"),
    Article("New Startup idea", "Mega", "${Random().nextInt(24)} HOURS AGO"),
    Article("New Startup idea", "Mega", "${Random().nextInt(24)} HOURS AGO"),
    Article("New Startup idea", "Mega", "${Random().nextInt(24)} HOURS AGO"),
    Article("New Startup idea", "Mega", "${Random().nextInt(24)} HOURS AGO"),
    Article("New Startup idea", "Mega", "${Random().nextInt(24)} HOURS AGO"),
    Article("New Startup idea", "Mega", "${Random().nextInt(24)} HOURS AGO"),
  ];
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Colors.red)),
                Column(
                  children: <Widget>[
                    Text(articles[index].time),
                    Text(articles[index].title),
                    Text("by ${articles[index].author}"),
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: articles.length,
      ),
    );
  }
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
                return DrawerNavigationItemWidget(
                    navigationItem: navigationItems[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerNavigationItemWidget extends StatelessWidget {
  const DrawerNavigationItemWidget({
    Key key,
    @required this.navigationItem,
  }) : super(key: key);

  final NavigationItem navigationItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Icon(navigationItem.icon),
      title: Text(
        navigationItem.title,
        maxLines: 1,
      ),
    );
  }
}
