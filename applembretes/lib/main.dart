import 'package:applembretes/models/lembrete_modal.dart';
import 'package:applembretes/screens/lembrete_editor.dart';
import 'package:applembretes/widgets/my_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';

late Box box;
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<Lembrete>(LembreteAdapter());
  box = await Hive.openBox<Lembrete>('lembretes');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: ValueListenableBuilder<Box<Lembrete>>(
          valueListenable: Hive.box<Lembrete>("Lembretes").listenable(),
          builder: (context, box, _) {
            return Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Meus Lembretes',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    DateFormat.yMd().add_jm().format(DateTime.now()),
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                  Divider(
                    height: 40.0,
                    thickness: 1.0,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: box.values.length,
                      itemBuilder: (context, index) {
                        Lembrete currentLembrete = box.getAt(index)!;
                        return MyListTile(currentLembrete, index);
                      },
                    ),
                  ),
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => LembreteEditor()));
        },
        child: Container(
            child: Icon(Icons.add, color: Colors.white,)),
      ),
    );
  }
}
