import 'package:flutter/material.dart';
import 'package:grocery/model/grocery.dart';
import 'package:intl/intl.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key, required this.onAdd});

  final Function(Grocery grocery) onAdd;

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  void saveButton() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
    widget.onAdd(Grocery(name: enterName,
        quantity: enterQuantity,
        amount: enterAmount,
        type: selectedType,
        date: _selectedDate!));
    Navigator.of(context).pop();
  }

  final formatter = DateFormat.yMd();
  DateTime? _selectedDate = DateTime.now();

  Future<void> datePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  String selectedType = 'fruits';
  List<String> items = [
    'fruits',
    'vegetable',
    'diary',
    'HomeItem',
  ];
  final _formKey = GlobalKey<FormState>();
  var enterName = '';
  var enterAmount = '1';
  var enterQuantity = '1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ADD ITEM'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                onSaved: (value) {
                  enterName = value!;
                },
                maxLength: 50,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value
                          .trim()
                          .length <= 1 ||
                      value
                          .trim()
                          .length >= 50) {
                    return 'Must add valid value.';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: enterAmount,
                      onSaved: (value) {
                        enterAmount = value!;
                      },
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null ||
                            int.tryParse(value)! <= 0) {
                          return 'Must add valid value.';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Price',
                        prefixText: '\$  ',
                      ),
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    child: TextFormField(
                      initialValue: enterQuantity,
                      onSaved: (value) {
                        enterQuantity = value!;
                      },
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null ||
                            int.tryParse(value)! <= 0) {
                          return 'Must add valid value.';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      //initialValue: enteredValue.toString(),
                      decoration: const InputDecoration(labelText: 'Quantity'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  DropdownButton(
                      hint: const Text('Select your option'),
                      value: selectedType,
                      items: items
                          .map(
                            (valueItem) =>
                            DropdownMenuItem<String>(
                              value: valueItem,
                              child: Text(valueItem),
                            ),
                      )
                          .toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedType = newValue!;
                        });
                      }),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        formatter.format(_selectedDate!),
                      ),
                      IconButton(
                        onPressed: () {
                          datePicker();
                        },
                        icon: const Icon(Icons.calendar_month),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel')),
                  const SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      saveButton();
                    },
                    child: const Text('Save'),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
