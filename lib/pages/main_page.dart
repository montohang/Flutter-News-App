part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  BottomNavBarBloc _bottomNavBarBloc;
  @override
  void initState() {
    super.initState();
    _bottomNavBarBloc = BottomNavBarBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: Style.Colors.mainColor,
          title: Text(
            "NewsApp",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: SafeArea(
        child: StreamBuilder<NavBarItem>(
          stream: _bottomNavBarBloc.itemStream,
          initialData: _bottomNavBarBloc.defaultItem,
          builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
            switch (snapshot.data) {
              case NavBarItem.HOME:
                return HomePage();
              case NavBarItem.SOURCES:
                return SourcePage();
              case NavBarItem.SEARCH:
                return SearchPage();
            }
          },
        ),
      ),
      bottomNavigationBar: StreamBuilder(
        stream: _bottomNavBarBloc.itemStream,
        initialData: _bottomNavBarBloc.defaultItem,
        builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[100], spreadRadius: 0, blurRadius: 10),
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                iconSize: 20,
                unselectedItemColor: Style.Colors.grey,
                unselectedFontSize: 9.5,
                selectedFontSize: 9.5,
                type: BottomNavigationBarType.fixed,
                fixedColor: Style.Colors.mainColor,
                currentIndex: snapshot.data.index,
                onTap: _bottomNavBarBloc.pickItem,
                items: [
                  BottomNavigationBarItem(
                      title: Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          "Home",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      icon: Icon(EvaIcons.homeOutline),
                      activeIcon: Icon(EvaIcons.home)),
                  BottomNavigationBarItem(
                      title: Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          "Sources",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      icon: Icon(EvaIcons.gridOutline),
                      activeIcon: Icon(EvaIcons.grid)),
                  BottomNavigationBarItem(
                      title: Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          "Search",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      icon: Icon(EvaIcons.searchOutline),
                      activeIcon: Icon(EvaIcons.search)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget testScreen() {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[Text("Test Screen")],
      ),
    );
  }
}
