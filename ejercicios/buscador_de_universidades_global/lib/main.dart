import 'dart:convert'; // para convertir el JSON que llega de la API a objetos Dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // para hacer la petición GET a la API

void main() {
  // arrancamos la app directo con la pantalla de universidades, sin nada extra
  runApp(const MaterialApp(home: UniversidadesPage()));
}

// ── MODELO ──────────────────────────────────────────────────────────────────
// esta clase representa UNA universidad tal como viene en el JSON
class Universidad {
  final String nombre;
  final String pais;
  final String sitioweb;

  Universidad({required this.nombre, required this.pais, required this.sitioweb});

  // factory = constructor especial que recibe un Map (el objeto JSON parseado)
  // el ?? es por si algún campo viene null o no existe → ponemos un valor por defecto
  factory Universidad.fromJson(Map<String, dynamic> json) {
    return Universidad(
      nombre:   json['nombre']   ?? 'Sin nombre',
      pais:     json['pais']     ?? '',
      sitioweb: json['sitioweb'] ?? '',
    );
  }
}

// ── WIDGET PRINCIPAL ─────────────────────────────────────────────────────────
class UniversidadesPage extends StatefulWidget {
  const UniversidadesPage({super.key});
  @override
  State<UniversidadesPage> createState() => _UniversidadesPageState();
}

class _UniversidadesPageState extends State<UniversidadesPage> {
  final _controller = TextEditingController(); // controla lo que el usuario escribe

  // estas tres variables manejan los 3 estados de la UI
  bool _cargando = false;   // true mientras espera respuesta de la API
  bool _buscado  = false;   // true una vez que ya se hizo al menos una búsqueda
  List<Universidad> _resultados = []; // lista que se pinta en pantalla

  // ── LÓGICA DE RED ──────────────────────────────────────────────────────────
  // async porque hace una petición HTTP que tarda → hay que esperar con await
  Future<void> _buscar() async {
    // avisamos que empezó la carga para mostrar el spinner
    setState(() { _cargando = true; _buscado = false; });

    // hacemos el GET a la API → trae los 50 registros siempre
    final response = await http.get(
      Uri.parse('https://69de37ca410caa3d47bace81.mockapi.io/universidades'),
    );

    // jsonDecode convierte el String JSON en una List de Maps
    final List todas = jsonDecode(response.body);

    final paisFiltro = _controller.text.trim().toLowerCase();

    setState(() {
      _resultados = todas
          .map((e) => Universidad.fromJson(e))    // cada Map → objeto Universidad
          .where((u) => u.pais.toLowerCase().contains(paisFiltro)) // filtramos localmente
          .toList();
      _cargando = false;
      _buscado  = true;
    });
  }

  // ── UI ─────────────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buscador de Universidades')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // donde el usuario escribe el país a buscar
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Filtrar por país',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            // al tocar llama a _buscar() que hace todo el trabajo
            ElevatedButton(
              onPressed: _buscar,
              child: const Text('Buscar'),
            ),
            const SizedBox(height: 16),

            // ESTADOS: solo uno de estos tres se muestra a la vez
            if (_cargando)
              const CircularProgressIndicator() // spinner mientras llega la respuesta

            else if (_buscado && _resultados.isEmpty)
              const Text('No se encontraron universidades.') // lista vino vacía

            else
              // Expanded para que el ListView ocupe el espacio restante de la pantalla
              Expanded(
                child: ListView.builder(
                  itemCount: _resultados.length,
                  itemBuilder: (context, i) => ListTile(
                    title: Text(_resultados[i].nombre),
                    subtitle: Text(_resultados[i].sitioweb),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}