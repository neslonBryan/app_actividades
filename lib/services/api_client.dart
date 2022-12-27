import 'dart:convert';

import 'package:app_actividades/models/actividad_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  Future<Activity> getActivity() async {
    late Activity activity;
    const url = 'https://www.boredapi.com/api/activity/';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode < 300) {
      final jsonResponse = jsonDecode(response.body);
      activity = Activity.fromJson(jsonResponse);
    } else {
      debugPrint(response.body);
    }
    return activity;
  }
}
