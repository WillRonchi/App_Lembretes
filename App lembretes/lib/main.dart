import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {
  int quantCard = 0;

  void incrementCounter() {
    setState(() {
      quantCard++;
    });
  }

  void decrementCounter() {
    setState(() {
      quantCard--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade800,
        body: Container(
          margin: const EdgeInsets.all(10),
          child: masonruLayout(context),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            color: Colors.grey.shade900,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: OverflowBar(
                overflowAlignment: OverflowBarAlignment.center,
                alignment: MainAxisAlignment.center,
                overflowSpacing: 5.0,
                children: <Widget>[
                  IconButton(
                    onPressed: () => {
                      incrementCounter()
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget masonruLayout(BuildContext context) {

    return MasonryGridView.builder(
        scrollDirection: Axis.vertical,
        crossAxisSpacing: 10,
        mainAxisSpacing: 15,
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), // Quantidade de colunas
        itemCount: quantCard,
        itemBuilder: (context, index) {
          return Card(
            color: Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),           // Randomiza as cores de cada card
            child: Padding(
              padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 30,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Lembrete',
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Container(           // Campo do texto
                      padding: const EdgeInsets.only(top: 20,bottom: 15),
                      child: TextFormField(
                        maxLines: 5,
                      ),
                    ),
                    Container(           // ------- Botão de remover card
                      alignment: const Alignment(-1, -1),
                      child: IconButton(
                        onPressed: () => {
                          decrementCounter()
                        },
                        icon: const Icon(
                          Icons.remove_circle,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
        });
  }
}
