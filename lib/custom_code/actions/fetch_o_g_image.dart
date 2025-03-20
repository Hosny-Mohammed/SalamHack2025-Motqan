// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as html;
import 'package:html/dom.dart' as dom;

Future<String> fetchOGImage(String url) async {
  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var document = html.parse(response.body);
      dom.Element? ogImageElement =
          document.querySelector("meta[property='og:image']");

      if (ogImageElement != null) {
        return ogImageElement.attributes['content'] ??
            "https://picsum.photos/seed/790/600";
      } else {
        return "https://picsum.photos/seed/790/600"; // No OG image found
      }
    } else {
      return "https://picsum.photos/seed/790/600";
    }
  } catch (e) {
    return "https://picsum.photos/seed/790/600";
  }
}
