import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts List"),
      ),
      body: ListView(
        children: const [
          Card(
            child: ListTile(
              title: Text(
                "Gui",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              subtitle: Text(
                "1000",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
