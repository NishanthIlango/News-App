import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum NewsType{
  TopTrending,
  allNews, topTrending,
}

enum SortByEnum{
  relevancy,
  popularity,
  publishedAt,
}

TextStyle smallTextStyle=GoogleFonts.montserrat(fontSize: 15);

const List<String> searchKeywords =[
  "Football",
  "Flutter",
  "Python",
  "Weather",
  "Crypto",
  "Bitcoin",
  "Youtube",
  "Netflix",
  "Meta"
];