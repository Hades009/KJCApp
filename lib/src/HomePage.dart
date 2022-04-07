import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

const barCol = Color(0xFF120E43);
const TextStyle todayStyle = TextStyle(
    fontSize: 26,
    decoration: TextDecoration.underline,
    fontFamily: 'Raleway',
    fontWeight: FontWeight.bold);

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
  final urlTodays = [
    'https://kjc.sgp1.digitaloceanspaces.com/glimpses/news/image-1648639192231.jpg',
    'https://kjc.sgp1.digitaloceanspaces.com/glimpses/news/image-1648639482979.jpg',
    'https://kjc.sgp1.digitaloceanspaces.com/glimpses/news/image-1648806582027.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(padding: EdgeInsets.only(top: 10)),
        CarouselSlider.builder(
          options: CarouselOptions(
            height: 240,
            autoPlay: true,
          ),
          itemCount: urlImages.length,
          itemBuilder: (context, index, realIndex) {
            final urlImage = urlImages[index];
            return buildImage(urlImage, index);
          },
        ),
        const Padding(padding: EdgeInsets.only(top: 25)),
        const Text('Today', style: todayStyle),
        const Padding(padding: EdgeInsets.only(top: 30)),
        CarouselSlider.builder(
          options: CarouselOptions(
            height: 300,
            autoPlay: false,
          ),
          itemCount: urlTodays.length,
          itemBuilder: (context, index, realIndex) {
            final urlToday = urlTodays[index];
            return buildImage(urlToday, index);
          },
        ),
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

Widget buildToday(String urlToday, int index) => Container(
      padding: const EdgeInsets.all(8),
      child: Image.network(
        urlToday,
        fit: BoxFit.contain,
      ),
      color: Colors.white,
    );
