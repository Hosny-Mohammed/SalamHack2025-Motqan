// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:google_generative_ai/google_generative_ai.dart';

Future<List<PhaseStruct>> generatePhases(String prompt) async {
  var apiKey = "AIzaSyAPvssTzSt81g9Q6vhIFkD02SxSZgssEE0";

  final schema = Schema.array(
      description: 'List of phases.',
      items: Schema.object(
        properties: {
          'name': Schema.string(
              description: 'The name of the phase.', nullable: false),
          'description': Schema.string(
              description: 'Details of the phase.', nullable: false),
          'achivePeriod': Schema.integer(
              description: 'Number of days to complete this phase.',
              nullable: false),
          'materials': Schema.array(
            description: 'List of material URLs.',
            items: Schema.string(description: 'URL of the material.'),
            nullable: false,
          ),
          'checkListTasks': Schema.array(
            description: 'List of tasks of this phase.',
            items: Schema.string(description: 'task content.'),
            nullable: false,
          ),
        },
        requiredProperties: [
          'name',
          'description',
          'achivePeriod',
          'materials',
          'checkListTasks',
        ],
      ),
      nullable: false);

  var model = GenerativeModel(
    model: 'gemini-1.5-pro',
    apiKey: apiKey,
    generationConfig: GenerationConfig(
      responseMimeType: 'application/json',
      responseSchema: schema,
    ),
  );

  var response = await model.generateContent([Content.text(prompt)]);

  // Decode the JSON response
  final List<dynamic> jsonMap = jsonDecode(response.text ?? '[]');

  // Convert to Target object
  return jsonMap.map((e) => PhaseStruct.fromMap(e)).toList();
}
