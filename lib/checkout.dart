import 'package:flutter/material.dart';
import 'package:mobail_shop/model/model.dart';
import 'package:provider/provider.dart';

class Chekout extends StatefulWidget {
  const Chekout({super.key});

  @override
  State<Chekout> createState() => _ChekoutState();
}

class _ChekoutState extends State<Chekout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Chekout Basket"),
        ),
        body: Consumer<Model>(
          builder: (context, value, child) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shop_2_outlined,
                      color: Colors.blue,
                      size: 50,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "( ${value.basketItem.length} )",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                RichText(
                  text: TextSpan(
                    text: 'Total Price ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: " ${value.totalPrice} \$",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.blue)),
                    ],
                  ),
                ),
                Divider(
                  endIndent: 60,
                  indent: 60,
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: value.basketItem.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text("${value.basketItem[index].name}"),
                          trailing: IconButton(
                              onPressed: () {
                                value.remove(value.basketItem[index]);
                              },
                              icon: Icon(Icons.delete)),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ));
  }
}
