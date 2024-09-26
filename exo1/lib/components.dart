import 'package:flutter/material.dart';
import 'package:tp_flutter/consts.dart';

// Composant MyPadding qui applique le padding par défaut
class MyPadding extends Padding {
const MyPadding({super.key, required super.child}): super(padding: defaultPadding);
}

class MyText extends Text {
const MyText(super.data, {super.key}): super(style: defaultTextStyle);
}

String? stringNotEmptyValidator (value, message) {
if (value == null || value.trim().isEmpty) {
return message;
}
return null;
}