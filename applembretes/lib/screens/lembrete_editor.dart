import 'package:applembretes/main.dart';
import 'package:applembretes/models/lembrete_modal.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LembreteEditor extends StatefulWidget {
  LembreteEditor({this.lembrete, Key? key}) : super(key: key);

  Lembrete? lembrete;
  @override
  State<LembreteEditor> createState() => _LembreteEditorState();
}

class _LembreteEditorState extends State<LembreteEditor> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _lembreteTitle = TextEditingController(
        text: widget.lembrete == null ? null : widget.lembrete!.title!);
    TextEditingController _lembreteNote = TextEditingController(
        text: widget.lembrete == null ? null : widget.lembrete!.note!);
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          widget.lembrete == null ? "Adicionar Lembrete" : "Editar Lembrete",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Título do Lembrete",
              style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _lembreteTitle,
              decoration: InputDecoration(
                fillColor: Colors.grey.shade500.withAlpha(200),
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                "Descrição do Lembrete",
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            TextField(
              keyboardType: TextInputType.multiline,
              minLines: 5,
              maxLines: 25,
              controller: _lembreteNote,
              decoration: InputDecoration(
                fillColor: Colors.grey.shade500.withAlpha(200),
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 60.0,
                  child: RawMaterialButton(
                    onPressed: () async {
                      var newLembrete = Lembrete(
                        title: _lembreteTitle.text,
                        note: _lembreteNote.text,
                        creation_date: DateTime.now(),
                        done: false,
                      );
                      Box<Lembrete> lembox = Hive.box<Lembrete>('lembretes');
                      if (widget.lembrete != null) {
                        widget.lembrete!.title = newLembrete.title;
                        widget.lembrete!.note = newLembrete.note;
                        widget.lembrete!.save();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      } else {
                        await lembox.add(newLembrete);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      }
                    },
                    fillColor: Colors.lightBlue,
                    child: Text(
                      widget.lembrete == null
                          ? 'Adicionar Lembrete'
                          : 'Salvar Lembrete',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
