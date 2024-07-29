import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobail_shop/addmobail.dart';
import 'package:mobail_shop/checkout.dart';
import 'package:mobail_shop/login.dart';
import 'package:provider/provider.dart';
import './model/item.dart';
import './model/model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Item> items = [
    Item(name: "S20 ultra", price: 250),
    Item(name: "P30 pro", price: 400),
    Item(name: "Iphone 15 pro", price: 800),
    Item(name: "Iphone 11 pro", price: 300)
  ];

  void addItem(Item item) {
    setState(() {
      items.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        Chekout(), // Ensure you have this page
                  ));
                },
                icon: Icon(Icons.add_shopping_cart),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Consumer<Model>(
                  builder: (context, value, child) {
                    return Text("${value.count}");
                  },
                ),
              ),
            ],
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      drawer: DrawerHome(),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            child: Consumer<Model>(
              builder: (context, value, child) {
                return ListTile(
                  leading: Icon(Icons.phone_android),
                  title: Text(
                    "${items[index].name}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("Price: ${items[index].price}"),
                  trailing: IconButton(
                    onPressed: () {
                      value.add(items[index]);
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: AddMobileWidget(onAdd: addItem),
    );
  }
}

class DrawerHome extends StatelessWidget {
  const DrawerHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
              arrowColor: Colors.black,
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("lib/assets/muslim.jpg"),
              ),
              accountName: Text("Muslim"),
              accountEmail: Text("muslim@gmail.com")),
          Spacer(),
          ListTile(
            iconColor: Colors.red,
            tileColor: Color.fromARGB(255, 14, 104, 177),
            onTap: () {
              Get.to(LoginPage());
            },
            contentPadding: EdgeInsets.all(5),
            title: Text(
              "Logout",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            trailing: Icon(
              Icons.logout,
            ),
          )
        ],
      ),
    );
  }
}
