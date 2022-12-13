import 'package:flutter/material.dart';
import 'package:ui_test/widgets/Carousel.dart';
import 'package:ui_test/widgets/TopBarContents.dart';
import 'package:ui_test/widgets/featuredHeading.dart';
import 'package:ui_test/widgets/featuredTiles.dart';
import 'package:ui_test/widgets/floating_quick_access_bar.dart';
import 'package:ui_test/widgets/mainHeading.dart';
import '../widgets/BottomBar.dart';
import '../widgets/menu_drawer.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;
  bool _barVal=true;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;

    });
  }


  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;
      return Scaffold(
      extendBodyBehindAppBar:_barVal,
      appBar:screenSize.width<800?AppBar(
        iconTheme: const IconThemeData(color: Colors.blue),
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(_opacity),
        title: const Text('GOLD SERVICE',style: TextStyle(
          color: Color(0xFF077bd7),
          fontSize: 26,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w900,
          letterSpacing: 3
        ),),
      ): PreferredSize(

        preferredSize: Size(screenSize.width,70),
        child: TopBarContents(_opacity),
      ),

      drawer: MenuDrawer(),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  child: SizedBox(
                    height: screenSize.height * 0.85,
                    width: screenSize.width,
                    child: Image.asset(
                      "lib/assets/images/background.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  children: [
                    FloatingQuickAccessBar(screenSize: screenSize),
                    FeaturedHeading(screenSize: screenSize),
                    FeaturedTiles(screenSize: screenSize),
                    MainHeading(screenSize: screenSize),
                    MainCarousel(),
                    BottomBar()
                  ],
                ),
               ],
            ),

          ],
        ),

      ),

    );
  }
}
