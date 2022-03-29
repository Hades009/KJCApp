import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

const barCol = Color(0xFF120E43);
const TextStyle todayStyle = TextStyle(
    fontSize: 26,
    decoration: TextDecoration.underline,
    fontFamily: 'Raleway',
    fontWeight: FontWeight.bold);
const todayPadding = EdgeInsets.symmetric(horizontal: 50);

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final urlImages = [
    'https://gyaanarth.com/gyan-content/uploads/2021/09/Kristu-Jayanti-College-KJC-Bangalore.jpeg',
    'https://www.kristujayantilaw.edu.in/images/achivements-banner.jpg',
    'https://kristujayanti.edu.in/images/final-slider-10.jpg',
    'https://kristujayanti.edu.in/images/LIBRARY-BANN.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CarouselSlider.builder(
          options: CarouselOptions(
            height: 230,
            autoPlay: true,
          ),
          itemCount: urlImages.length,
          itemBuilder: (context, index, realIndex) {
            final urlImage = urlImages[index];
            return buildImage(urlImage, index);
          },
        ),
        const Padding(padding: todayPadding),
        const Text('Today', textAlign: TextAlign.center, style: todayStyle),
      ],
    );
  }
}

Widget buildImage(String urlImage, int index) => Container(
      padding: const EdgeInsets.all(8),
      child: Image.network(
        urlImage,
        fit: BoxFit.cover,
      ),
      color: Colors.white,
    );
