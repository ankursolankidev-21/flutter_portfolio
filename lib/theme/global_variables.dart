library globals;
import 'package:flutter/material.dart';

/// You need a global navigator key
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

/// Global function to navigate to next page
void nextPage(Widget page) {
  navigatorKey.currentState?.push(
    MaterialPageRoute(builder: (context) => page),
  );
}

/// A global back button widget
Widget backButton(BuildContext context, {String text = "Back"}) {
  return ElevatedButton(
    onPressed: () => Navigator.pop(context),
    child: Text(text),
  );
}

///----- Space between to widgets
//This _spaceUnit is globally same so if any change in future for spacing this single change help to All UI spacing change
const double _spaceUnit = 10;
SizedBox spaceHeight([double multiplier = 1]) => SizedBox(height: _spaceUnit * multiplier);
SizedBox spaceWidth([double multiplier = 1]) => SizedBox(width: _spaceUnit * multiplier);


SizedBox fixWidth() => SizedBox(width: 15 );
SizedBox fixHeight() => SizedBox(height: 15 );

///---- printF is use for debug print
bool debugMode = true;
bool showPageName = true;
bool showFunctionName = true;

void printF(String input) {
  if (!debugMode) return;

  final raw = StackTrace.current.toString().split('\n')[1];

  final fileName = _extractFileName(raw);
  final functionName = _extractFunctionName(raw);

  String prefix = "";

  if (showPageName) {
    prefix += fileName;
  }

  if (showFunctionName && functionName.isNotEmpty) {
    if (prefix.isNotEmpty) prefix += " -> ";
    prefix += functionName;
  }

  if (prefix.isNotEmpty) {
    print("$prefix -> $input");
  } else {
    print("-> $input");
  }
}


String _extractFileName(String line) {
  final match = RegExp(r'(\w+\.dart)').firstMatch(line);
  return match != null ? match.group(1)! : "UnknownPage";
}

String _extractFunctionName(String line) {
  // Extract something like "loginUser" from "#1      loginUser (package:app/login.dart:...)".
  final match = RegExp(r'#\d+\s+(\w+)').firstMatch(line);
  if (match == null) return "";
  final name = match.group(1)!;

  // Remove Flutter internal function names
  if (["build", "performRebuild", "createState"].contains(name)) return "";

  return name;
}
