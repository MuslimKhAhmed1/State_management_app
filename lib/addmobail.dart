import 'package:flutter/material.dart';
import 'model/item.dart';

class AddMobileWidget extends StatefulWidget {
  final Function(Item) onAdd;

  const AddMobileWidget({Key? key, required this.onAdd}) : super(key: key);

  @override
  State<AddMobileWidget> createState() => _AddMobileWidgetState();
}

class _AddMobileWidgetState extends State<AddMobileWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameMob = TextEditingController();
  final TextEditingController _priceMOb = TextEditingController();

  @override
  void dispose() {
    _nameMob.dispose();
    _priceMOb.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showBottomSheet(
          backgroundColor: const Color.fromARGB(255, 219, 230, 253),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          context: context,
          builder: (context) {
            return Form(
              key: _formKey,
              child: Container(
                height: 290,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Add Mobile to the list",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _nameMob,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Mobile name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Mobile name",
                          filled: true,
                          fillColor: const Color.fromARGB(255, 230, 230, 230),
                          hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 117, 117, 117),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _priceMOb,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter price';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Price \$",
                          filled: true,
                          fillColor: const Color.fromARGB(255, 230, 230, 230),
                          hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 117, 117, 117),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: const ButtonStyle(
                            minimumSize: WidgetStatePropertyAll(Size(90, 40)),
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.blue),
                          ),
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              String name = _nameMob.text;
                              double? price = double.tryParse(_priceMOb.text);

                              if (price != null) {
                                Item newItem = Item(name: name, price: price);
                                widget.onAdd(newItem);

                                _nameMob.clear();
                                _priceMOb.clear();

                                Navigator.pop(context);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please enter a valid price'),
                                  ),
                                );
                              }
                            }
                          },
                          child: const Text(
                            "Add Mobile",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            minimumSize: WidgetStatePropertyAll(Size(120, 40)),
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.blue),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Cancel",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      backgroundColor: Colors.blue,
      child: const Icon(Icons.add),
    );
  }
}
