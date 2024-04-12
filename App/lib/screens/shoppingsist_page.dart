import 'package:flutter/material.dart';

class ShoppingListPage extends StatefulWidget {
  @override
  _ShoppingListPageState createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  List<String> shoppingList = ['Apples', 'Bananas', 'Milk', 'Bread']; // Sample shopping list items

  TextEditingController _itemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      body: ListView.builder(
        itemCount: shoppingList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(shoppingList[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                _deleteItem(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addItem(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _addItem(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Item'),
          content: TextField(
            controller: _itemController,
            decoration: InputDecoration(labelText: 'Item'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  shoppingList.add(_itemController.text);
                  _itemController.clear();
                  Navigator.of(context).pop();
                });
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _deleteItem(int index) {
    setState(() {
      shoppingList.removeAt(index);
    });
  }
}

void main() {
  runApp(MaterialApp(
    home: ShoppingListPage(),
  ));
}
