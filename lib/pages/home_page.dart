import 'package:app_actividades/models/actividad_models.dart';
import 'package:app_actividades/services/api_client.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

bool loading = false;
Activity activity = Activity(
  activity: "activity",
  type: "type",
  link: "link",
  participants: 0,
  price: 0.0,
);

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("app Actividades"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              color: Colors.deepPurple,
              padding: const EdgeInsets.all(30),
              child: loading
                  ? const Center(
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          activity.activity,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          activity.type,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "participantes: ${activity.participants}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Roboto',
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "precio :S/. ${activity.price}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Roboto',
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
              onPressed: () async {
                setState(() {
                  loading = false;
                });
                activity = await ApiClient().getActivity();
              },
              child: const Text(
                "Obtener nueva actividad",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
