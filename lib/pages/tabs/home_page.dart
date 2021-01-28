part of 'tabs.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        HeadlingSliderWidget(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Text(
                "Top channels",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0),
              )
            ],
          ),
        ),
        TopChannelsWidget(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Text("Hot news",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0))
            ],
          ),
        ),
        HotNewsWidget()
      ],
    );
  }
}
