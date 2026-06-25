import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PokemonPage(),
    );
  }
}

class PokemonPage extends StatefulWidget {
  const PokemonPage({super.key});

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  final TextEditingController nombreController = TextEditingController();

  List<String> pokemonesDisponibles = [];
  List<String> seleccionados = [];

  final String apiUrl =
      "https://6a3a87e9917c7b14c74db040.mockapi.io/pokemones";

  @override
  void initState() {
    super.initState();
    cargarPokemones();
  }

  Future<void> cargarPokemones() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List datos = jsonDecode(response.body);

        Set<String> pokemonSet = {};

        for (var entrenador in datos) {
          List lista = entrenador["pokemones"];

          for (var pokemon in lista) {
            pokemonSet.add(pokemon.toString());
          }
        }

        setState(() {
          pokemonesDisponibles = pokemonSet.toList()..sort();
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> guardarEntrenador() async {
    String nombre = nombreController.text.trim();

    if (nombre.isEmpty) {
      mostrarMensaje("Ingrese el nombre del entrenador");
      return;
    }

    if (seleccionados.isEmpty) {
      mostrarMensaje("Seleccione al menos un Pokémon");
      return;
    }

    if (seleccionados.length > 6) {
      mostrarMensaje("Máximo 6 Pokémon");
      return;
    }

    Map<String, dynamic> entrenador = {
      "entrenador": nombre,
      "pokemones": seleccionados
    };

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(entrenador),
    );

    if (response.statusCode == 201) {
      mostrarMensaje("Entrenador registrado");

      setState(() {
        seleccionados.clear();
      });

      nombreController.clear();
    } else {
      mostrarMensaje("Error al guardar");
    }
  }

  void mostrarMensaje(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensaje)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liga Pokémon"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(
                labelText: "Nombre del entrenador",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            Text(
              "Pokémon seleccionados: ${seleccionados.length}/6",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: pokemonesDisponibles.length,
                itemBuilder: (context, index) {
                  String pokemon = pokemonesDisponibles[index];

                  return CheckboxListTile(
                    title: Text(pokemon),
                    value: seleccionados.contains(pokemon),
                    onChanged: (valor) {
                      setState(() {
                        if (valor == true) {
                          if (seleccionados.length < 6) {
                            seleccionados.add(pokemon);
                          } else {
                            mostrarMensaje(
                              "No puedes tener más de 6 Pokémon",
                            );
                          }
                        } else {
                          seleccionados.remove(pokemon);
                        }
                      });
                    },
                  );
                },
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: guardarEntrenador,
                child: const Text("Registrar entrenador"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}