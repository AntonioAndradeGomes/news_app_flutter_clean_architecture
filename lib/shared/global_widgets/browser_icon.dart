import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BrowserIcon extends StatelessWidget {
  const BrowserIcon({Key? key}) : super(key: key);

  IconData get icon {
    if (Platform.isIOS) {
      return FontAwesomeIcons.safari;
    } else if (Platform.isAndroid) {
      return FontAwesomeIcons.chrome;
    }
    return FontAwesomeIcons.globe;
  }

  @override
  Widget build(BuildContext context) {
    return Icon(icon);
  }
}
