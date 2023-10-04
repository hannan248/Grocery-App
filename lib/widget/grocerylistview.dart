import 'package:flutter/material.dart';
import 'package:grocery/widget/card.dart';
import 'package:grocery/model/grocery.dart';

class GroceryList extends StatelessWidget{
  const GroceryList({super.key,required this.grocery,required this.onRemove});
  final List<Grocery> grocery;
  final void Function(Grocery grocery) onRemove;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(itemCount: grocery.length,

          itemBuilder: (ctx,index)=>  Dismissible(
            background:Container(
              color:Colors.red,
                child: const Icon(Icons.delete,)),
            key: ValueKey(grocery[index]),
            onDismissed: (direction){onRemove(grocery[index]);},
            child: CardWidget(grocery: grocery[index],
            //here we collect our widget from card.dart file and pass grocery[index] that
              // we collect from constructor which pass data from mainScreen.dart
    ),
          )
      ),
    );


  }

}