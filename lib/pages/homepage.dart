import 'dart:convert';

import 'package:ai_radio/modals/radio.dart';
import 'package:ai_radio/utils/utilities.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MyRadio>? radios; // should i write var radios;
  @override
  void initState() {
    super.initState();
    fetchRadios();
  }

  // fetching radioJson file
  fetchRadios() async {
    await Future.delayed(Duration(seconds: 2));
    var radioJson = await rootBundle.loadString("assets/radio.json");
    radios = MyRadioList.fromJson(radioJson).radios;
    print(radios); // decoded data== radios
    // var tagline = radios['radios'][0]['tagline'];
    // print(tagline);
    // print(radios.length);
    //var img = radios['radios'][0]['color'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        // giving gradient color to whole screen
        AnimatedContainer(
          duration: Duration(seconds: 3),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [colour.red_col, colour.kgreen_col],
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd),
          ),
        ),
        // aapbar modification
        Container(
          height: 80,
          child: AppBar(
            backgroundColor: Colors.transparent,
            // systemOverlayStyle:
            //     SystemUiOverlayStyle(statusBarColor: Colors.transparent),
            centerTitle: true,
            elevation: 0,
            title: Shimmer(
              gradient:
                  RadialGradient(colors: [colour.kblue_col, colour.kgrey_col]),
              child: const Text(
                'AI RADIO',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),

        CarouselSlider.builder(
          itemCount: radios!.length,
          options: CarouselOptions(height: 500),
          itemBuilder: (context, index, realIndex) {
            final rad = radios![index];
            print(rad);
            // var image = rad['image'];
            //print(rad.tagline);
            return Container(
              child: Stack(
                children: [
                  // Image(image: NetworkImage(rad.image)),
                ],
              ),
            );
          },
        ),
      ]),
    );
  }
}
