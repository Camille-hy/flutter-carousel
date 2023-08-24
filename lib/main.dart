import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carousel',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 0;
  final List<String> _images = ['cat1.jpg', 'cat2.jpg', 'cat3.jpg', 'cat4.jpg'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carousel'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider.builder(
              itemCount: _images.length,
              itemBuilder: (context, index, realIndex) {
                final image = _images[index];
                return buildImage(image, index);
              },
              options: CarouselOptions(
                  height: 300,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  }
                  // viewportFraction: 1,
                  // enlargeCenterPage: true,
                  // pageSnapping: false,
                  ),
            ),
            const SizedBox(
              height: 32,
            ),
            buildIndicator(),
            SizedBox(height: 16,),
            buildButtonForImage(activeIndex),
          ],
        ),
      ),
    );
  }

  Widget buildImage(String image, int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      color: Colors.grey,
      width: 400,
      child: Image.asset(
        'assets/${_images[index]}',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: _images.length,
      effect: SlideEffect(
        activeDotColor: Colors.blue,
        dotColor: Colors.black12,
      ),
    );
  }

  Widget buildButtonForImage(int index) {
    if (index == 0) {
      return ElevatedButton(
        onPressed: () {},
        child: Text('Cat 1'),
      );
    } else if (index == 1) {
      return OutlinedButton(
        onPressed: () {},
        child: Text('Cat 2'),
      );
    } else if (index == 2) {
      return ElevatedButton(
        onPressed: () {},
        child: Text('Cat 3'),
      );
    } else {
      return OutlinedButton(
        onPressed: () {},
        child: Text('Cat 4'),
      );
    }
  }
}
