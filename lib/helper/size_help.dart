import 'package:flutter/cupertino.dart';

class SIZE {
  height(context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    return sizeHeight;
  }

  widht(context) {
    final widht = MediaQuery.of(context).size.width;
    return widht;
  }
}
