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
        primarySwatch: Colors.green,
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

class LargeScreenHome extends StatefulWidget {
  @override
  _LargeScreenHomeState createState() => _LargeScreenHomeState();
}

class _LargeScreenHomeState extends State<LargeScreenHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Flexible(
              child: DrawerNavigation(
            showBackButton: false,
          )),
          verticalDivider(context),
          Flexible(
            child: ArticlesPage(
              onArticleTap: () {
                setState(() {});
              },
            ),
            flex: 2,
          ),
          verticalDivider(context),
          Flexible(
            child: ArticleDetailsPage(),
            flex: 3,
          ),
        ],
      ),
    );
  }

  Container verticalDivider(BuildContext context) {
    return Container(
      width: 1,
      height: MediaQuery.of(context).size.height,
      color: Colors.grey.withAlpha(50),
    );
  }
}

class ArticleDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("${Random().nextInt(100)}"),),);
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
      drawer: DrawerNavigation(
        showBackButton: true,
      ),
      body: ArticlesPage(
        onArticleTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ArticleDetailsPage()));
        },
      ),
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

class ArticlesPage extends StatefulWidget {
  final VoidCallback onArticleTap;

  const ArticlesPage({Key key, this.onArticleTap}) : super(key: key);

  @override
  _ArticlesPageState createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Container(
              height: 50.0,
              child: TabBar(
                tabs: [
                  Tab(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        'Latest',
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(color: Colors.green),
                      ),
                    ),
                  ),
                  Tab(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        'Popular',
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(color: Colors.green),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              ArticleListWidget(
                onArticleTap: () {
                  widget.onArticleTap();
                },
              ),
              ArticleListWidget(
                onArticleTap: () {
                  widget.onArticleTap();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ArticleListWidget extends StatefulWidget {
  final VoidCallback onArticleTap;

  const ArticleListWidget({Key key, this.onArticleTap}) : super(key: key);

  @override
  _ArticleListWidgetState createState() => _ArticleListWidgetState();
}

class _ArticleListWidgetState extends State<ArticleListWidget> {
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
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            widget.onArticleTap();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Colors.red)),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        articles[index].time,
                        style: Theme.of(context).textTheme.caption,
                        maxLines: 1,
                      ),
                      Text(
                        "${articles[index].title}${articles[index].title}${articles[index].title}${articles[index].title}",
                        style: Theme.of(context).textTheme.title,
                        maxLines: 1,
                      ),
                      Text.rich(
                        TextSpan(children: [
                          TextSpan(
                              text: 'by ',
                              style: Theme.of(context).textTheme.caption),
                          TextSpan(
                              text: articles[index].author,
                              style: Theme.of(context)
                                  .textTheme
                                  .body1
                                  .copyWith(color: Colors.green))
                        ]),
                        maxLines: 1,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: articles.length,
    );
  }
}

class DrawerNavigation extends StatelessWidget {
  final bool showBackButton;
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

  DrawerNavigation({Key key, this.showBackButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Visibility(
            visible: showBackButton,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BackButton(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: navigationItems.length,
              itemBuilder: (BuildContext context, int index) {
                return DrawerNavigationItemWidget(
                  navigationItem: navigationItems[index],
                  active: index == 0,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerNavigationItemWidget extends StatelessWidget {
  final bool active;

  const DrawerNavigationItemWidget({
    Key key,
    @required this.navigationItem,
    this.active,
  }) : super(key: key);

  final NavigationItem navigationItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: active,
      trailing: Icon(navigationItem.icon),
      title: Text(
        navigationItem.title,
        maxLines: 1,
      ),
    );
  }
}

bool isBigScreen(BuildContext context) {
  return MediaQuery.of(context).size.width > 600;
}
