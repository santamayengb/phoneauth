import 'dart:developer';

class Print {
  String msg;
  Print({
    required this.msg,
  });

  printme() {
    log('me $msg');
  }
}
