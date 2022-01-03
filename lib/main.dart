import 'package:flutter/material.dart';
import 'package:phoneauth/bootstrap.dart';
import 'package:phoneauth/core/log/log.dart';

import 'app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Print(msg: "Main").printme();
  bootstrap(builder: (auth) {
    return MyApp(
      auth: auth,
    );
  });
}
