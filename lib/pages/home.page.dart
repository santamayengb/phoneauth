import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneauth/core/auth/cubit/phoneauth_cubit.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.auth}) : super(key: key);

  final FirebaseAuth auth;

  final formkey = GlobalKey<FormState>();
  final code = TextEditingController();

  final String number = "9501179924";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Phone Auth"),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                TextFormField(
                  maxLength: 10,
                  decoration: const InputDecoration(
                    hintText: "9501179924",
                    counter: Offstage(),
                  ),
                  validator: _phoneValidator,
                  keyboardType: TextInputType.phone,
                ),
                TextFormField(
                  controller: code,
                  maxLength: 6,
                  decoration: const InputDecoration(
                    hintText: "code",
                    counter: Offstage(),
                  ),
                  validator: _phoneValidator,
                  keyboardType: TextInputType.phone,
                ),
                TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue)),
                    onPressed: () {
                      context.read<PhoneauthCubit>().getOtp("+919501179924");
                    },
                    child: const Text("Send OTP",
                        style: TextStyle(color: Colors.white))),
                TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue)),
                    onPressed: () {
                      context.read<PhoneauthCubit>().verifyOtp(code.text);
                    },
                    child: const Text("Verify OTP",
                        style: TextStyle(color: Colors.white))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String? _phoneValidator(value) {
  if (value.isEmpty) {
    return "Phone number is required";
  }
}
