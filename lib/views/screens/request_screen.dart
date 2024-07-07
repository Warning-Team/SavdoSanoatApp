import 'package:flutter/material.dart';
import 'package:savdosanoatapp/controllers/client_controller.dart';
import 'package:savdosanoatapp/models/request.dart';

// ignore: must_be_immutable
class RequestScreen extends StatefulWidget {
  Request request;
  RequestScreen({super.key, required this.request});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  final clientController = ClientController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Request"),
        centerTitle: true,
      ),
      body: Flexible(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                     Card(
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text(
                              "company name",
                              style: TextStyle(fontSize: 17),
                            ),
                            trailing: Text(
                              clientController.data.companyName,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                          ListTile(
                            title: const Text(
                              "strir",
                              style: TextStyle(fontSize: 17),
                            ),
                            trailing: Text(
                              clientController.data.stir.toString(),
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                          ListTile(
                            title: const Text(
                              "phone number",
                              style: TextStyle(fontSize: 17),
                            ),
                            trailing: Text(
                              clientController.data.phoneNumber,
                              style: const TextStyle(fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                    Flexible(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 150,
                        ),
                        itemBuilder: (ctx, index) {
                          return Card(
                            clipBehavior: Clip.hardEdge,
                            child: Image.network(
                              "",
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
