import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextH1 extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;

  const TextH1(this.text, {Key key, this.color, this.fontSize})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.lato(
            color: color,
            fontSize: this.fontSize == null ? 25 : this.fontSize));
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
