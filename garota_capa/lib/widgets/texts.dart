import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextH1 extends StatelessWidget {
  final String text;
  final Color color;

  const TextH1(this.text, {Key key, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.lato(color: color, fontSize: 25));
  }
}

class TextP extends StatelessWidget {
  final String text;
  final Color color;

  const TextP(this.text, {Key key, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.lato(color: color));
  }
}

class TextH2 extends StatelessWidget {
  final String text;
  final Color color;

  const TextH2(this.text, {Key key, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.lato(color: color, fontSize: 19));
  }
}
