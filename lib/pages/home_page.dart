import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, i) => Card(
              child: ListTile(
                leading: const Icon(
                  Icons.pages,
                ),
                title: Text("Title"),
                subtitle: Text("Description"),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete_forever,
                    color: Colors.red[900],
                  ),
                ),
                onTap: () {},
              ),
            ),
          ),
        ),
      ),
    );
  }
}
