import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Tareas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      home: const MyHomePage(title: 'Lista de Tareas'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> tareas = [];

  void agregarTarea() {
    if (_controller.text.trim().isNotEmpty) {
      setState(() {
        tareas.add({
          "titulo": _controller.text.trim(),
          "completada": false,
        });
      });

      _controller.clear();
    }
  }

  void eliminarTarea(int index) {
    setState(() {
      tareas.removeAt(index);
    });
  }

  void cambiarEstado(int index, bool? valor) {
    setState(() {
      tareas[index]["completada"] = valor ?? false;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(
          context,
        ).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Nueva tarea',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => agregarTarea(),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: agregarTarea,
                  child: const Text('Agregar'),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Text(
              'Total de tareas: ${tareas.length}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: tareas.isEmpty
                  ? const Center(
                      child: Text(
                        'No hay tareas registradas',
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  : ListView.builder(
                      itemCount: tareas.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: ListTile(
                            leading: Checkbox(
                              value: tareas[index]["completada"],
                              onChanged: (valor) {
                                cambiarEstado(index, valor);
                              },
                            ),
                            title: Text(
                              tareas[index]["titulo"],
                              style: TextStyle(
                                decoration:
                                    tareas[index]["completada"]
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                              ),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                eliminarTarea(index);
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}