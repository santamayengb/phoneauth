import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneauth/core/auth/cubit/phoneauth_cubit.dart';

class MultiBlocWrapper extends StatelessWidget {
  const MultiBlocWrapper({Key? key, required this.child, required this.auth})
      : super(key: key);

  final Widget child;
  final FirebaseAuth auth;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhoneauthCubit(auth: auth),
      child: child,
    );
  }
}
