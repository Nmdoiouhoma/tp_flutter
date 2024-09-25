import 'package:flutter/material.dart';
import 'package:exo2/consts.dart';

// Composant MyPadding qui applique le padding par défaut
class MyPadding extends StatelessWidget {
  final Widget child;
  const MyPadding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: child,
    );
  }
}

// Composant MyText qui applique le style de texte par défaut
class MyText extends StatelessWidget {
  final String data;
  const MyText(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(data, style: defaultTextStyle);
  }
}
