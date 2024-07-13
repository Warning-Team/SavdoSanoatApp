import 'package:flutter/material.dart';
import 'package:savdosanoatapp/controllers/client_controller.dart';
import 'package:savdosanoatapp/models/client.dart';
import 'package:savdosanoatapp/models/request.dart';
import 'package:url_launcher/url_launcher.dart';

class RequestScreen extends StatefulWidget {
  final Request request;
  RequestScreen({super.key, required this.request});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  Client? client;

  @override
  void initState() {
    super.initState();

    ClientController.getClinetByClientId(widget.request.cId).then((value) {
      if (value['error'] == null) {
        setState(() {
          client = Client.fromJson(value, "");
        });
      }
    });
  }

  void _openGoogleMaps(double latitude, double longitude) async {
    final String googleMapsUrl = "https://www.google.com/maps/dir/?api=1&destination=$latitude,$longitude";
    if (await canLaunchUrl(Uri.parse(googleMapsUrl))) {
      await launchUrl(Uri.parse(googleMapsUrl));
    } else {
      throw 'Could not open the map.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Request"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: const Text(
                      "Company Name",
                      style: TextStyle(fontSize: 17),
                    ),
                    trailing: Text(
                      client != null ? client!.companyName : "Loading...",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      "STIR",
                      style: TextStyle(fontSize: 17),
                    ),
                    trailing: Text(
                      client != null ? client!.stir.toString() : "Loading...",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      "Phone Number",
                      style: TextStyle(fontSize: 17),
                    ),
                    trailing: Text(
                      client != null ? client!.phoneNumber : "Loading...",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.request.description,
                  style: const TextStyle(fontSize: 17),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                _openGoogleMaps(widget.request.lat, widget.request.long);
              },
              child: const Text(
                " Location",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: widget.request.imageUrls.length,
              itemBuilder: (ctx, index) {
                return Card(
                  clipBehavior: Clip.hardEdge,
                  child: Image.network(
                    widget.request.imageUrls[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
