import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Cultural extends StatefulWidget {
  @override
  _CulturalState createState() => _CulturalState();
}

class _CulturalState extends State<Cultural> {
  final List<String> imgList = [
    'https://firebasestorage.googleapis.com/v0/b/edify-ff361.appspot.com/o/cultural%2F0.jpg?alt=media&token=a4d9c6e7-ae2a-4a15-9e85-536dfd02b58f',
    'https://firebasestorage.googleapis.com/v0/b/edify-ff361.appspot.com/o/cultural%2F1.jpg?alt=media&token=fdad4645-362e-4f62-beab-3e9cab2d9580',
    'https://firebasestorage.googleapis.com/v0/b/edify-ff361.appspot.com/o/cultural%2F2.jpg?alt=media&token=f0cf0b92-9c7a-456e-b887-bfd206a6f3e6',
    'https://firebasestorage.googleapis.com/v0/b/edify-ff361.appspot.com/o/cultural%2F3.jpg?alt=media&token=d417adc7-6409-43ba-8d7a-c6c25b2e5be9',
    'https://firebasestorage.googleapis.com/v0/b/edify-ff361.appspot.com/o/cultural%2F4.jpg?alt=media&token=325ec538-896d-4572-968e-a0f66928c1b2',
    'https://firebasestorage.googleapis.com/v0/b/edify-ff361.appspot.com/o/cultural%2F5.jpg?alt=media&token=e1030b45-4b53-430c-ad71-a3a3a8ac0db1',
    'https://firebasestorage.googleapis.com/v0/b/edify-ff361.appspot.com/o/cultural%2F6.jpg?alt=media&token=e9dfead0-23f9-44b8-b746-234a15e97663',
    'https://firebasestorage.googleapis.com/v0/b/edify-ff361.appspot.com/o/cultural%2F7.jpg?alt=media&token=acc566f6-affb-4c7d-86ad-93dc5a597a71',
  ];
  @override
  Widget build(BuildContext context) {
    List<Widget> imageSliders = imgList
        .map(
          (item) => Container(
            child: Container(
              height: double.infinity,
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(6.0)),
                child: Image.network(
                  item,
                  fit: BoxFit.cover,
                  width: 1000.0,
                ),
              ),
            ),
          ),
        )
        .toList();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: CarouselSlider(
            options: CarouselOptions(
              enableInfiniteScroll: true,
              autoPlay: true,
              aspectRatio: 2,
              enlargeCenterPage: false,
            ),
            items: imageSliders,
          ),
        ),
      ),
    );
  }
}
