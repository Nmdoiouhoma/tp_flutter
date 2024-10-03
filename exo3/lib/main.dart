import 'package:exo3/components.dart';
import 'package:exo3/consts.dart';
import 'package:exo3/page/breed.dart';
import 'package:exo3/services/catapi.dart';
import 'package:flutter/material.dart';
import 'package:exo3/models/breed.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercice 3',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;
  final catAPI = CatAPI();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Breed>> _breeds;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _breeds = widget.catAPI.breeds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
              Expanded(
              child: FutureBuilder<List<Breed>>(
                future: _breeds,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Erreur: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                        child: Text('Aucune donnée disponible'));
                  } else {
                    final data = snapshot.data!;
                    return ListView.builder(
                      padding: defaultPadding,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final breed = data[index];
                        return Card(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MyBreedPage(
                                    breed), // Passer l'objet Breed ici
                              ));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyPadding(child: MyText(breed.name)),
                                if (breed.image != null)
                                  Padding(
                                    padding: defaultPaddingAll,
                                    child: Image.network(
                                      breed.image!.url,
                                      alignment: Alignment.center,
                                      fit: BoxFit.fill,
                                      loadingBuilder:
                                          (context, child, progress) {
                                        if (progress == null) {
                                          return child;
                                        }
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      },
                                    ),
                                  ),
                                MyPadding(
                                  child: MyText(breed.description ??
                                      'Pas de description'),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
