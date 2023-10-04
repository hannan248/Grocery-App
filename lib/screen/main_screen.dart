import 'package:flutter/material.dart';
import 'package:grocery/screen/add_screen.dart';
import 'package:grocery/widget/grocerylistview.dart';
import 'package:grocery/model/grocery.dart';

class HomePage extends StatefulWidget {
   const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<Grocery> addedGrocery=[];
void addItem(Grocery grocery){
  setState(() {
    addedGrocery.add(grocery);
  });
}
void remove(Grocery grocery){
  setState(() {
    addedGrocery.remove(grocery);
  });
}

  @override
  Widget build(BuildContext context) {
    Widget content=const Center(
      child: Text('Try to add some Item'),
    );
  if(addedGrocery.isNotEmpty){
    //here we pass our data that we collect from addScreen.
     content= GroceryList(grocery:addedGrocery, onRemove:remove, );}


    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('YOURS GROCERIES'),
          actions: [
            IconButton(onPressed: ()  {
           Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) =>   AddScreen(onAdd:addItem,)),);

            }, icon: const Icon(Icons.add),)
          ],
        ),

        body:

           content,
        );
  }
}
