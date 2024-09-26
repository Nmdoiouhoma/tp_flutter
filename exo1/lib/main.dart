import 'package:flutter/material.dart';
import 'package:tp_flutter/consts.dart';
import 'package:tp_flutter/components.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle, // Utilisation de la constante appTitle
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name = '';

  void _sayHello() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Bonjour, $_name'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Merci'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(appTitle),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Champ de saisie avec le padding personnalisé
              MyPadding(
                child: TextFormField(
                  decoration: const InputDecoration(labelText: 'Votre nom'),
                  onSaved: (value) => _name = value ?? '',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer un nom';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              // Bouton avec largeur maximale
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _sayHello,
                  child: const Text('Dire Bonjour'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
