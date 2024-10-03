import 'package:exo3/consts.dart';
import 'package:exo3/services/catapi.dart';
import 'package:flutter/material.dart';
import '../models/breed.dart';
import 'package:exo3/components.dart';
import 'package:exo3/models/image.dart';

class MyBreedPage extends StatefulWidget {
  late Breed breed;
  late CatAPI catAPI = CatAPI();

  MyBreedPage(this.breed, {super.key});

  @override
  State<MyBreedPage> createState() => _MyBreedPageState();
}

class _MyBreedPageState extends State<MyBreedPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.breed.name),
      ),
      body: Form(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: defaultPaddingAll,
            child: MyText(widget.breed.description.toString()),
          ),
        ],
      )),
    );
  }
}
