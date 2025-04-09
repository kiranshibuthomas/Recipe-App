import 'package:flutter/material.dart';

class NameList extends StatefulWidget {
  const NameList({super.key});

  @override
  State<NameList> createState() => _NameListState();
}

class _NameListState extends State<NameList> {
  TextEditingController controller = TextEditingController();
  List<String> name = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(controller: controller),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    name.add(controller.text);

                  });
                },
                child: Text('Add'),
              ),
            ],
          ),
          Column(
            children: name.map((item) => Text(item)).toList(), // what is this for ?

          ),
        ],
      ),
    );
  }
}
