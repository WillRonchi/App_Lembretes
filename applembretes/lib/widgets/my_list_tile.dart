import 'package:applembretes/models/lembrete_modal.dart';
import 'package:applembretes/screens/lembrete_editor.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class MyListTile extends StatefulWidget {
  MyListTile(this.lembrete, this.index, {Key? key}) : super(key: key);
  Lembrete lembrete;
  int index;
  @override
  State<MyListTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.0),
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.lembrete.title!,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LembreteEditor(
                        lembrete: widget.lembrete,
                      ),
                    ),
                  );
                },
                icon: Icon(
                  Icons.edit,
                  color: Colors.green,
                ),
              ),
              IconButton(
                onPressed: () {
                  widget.lembrete.delete();
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.black87,
            height: 20.0,
            thickness: 1.0,
          ),
          Text(
            widget.lembrete.note!,
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
