import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'phoneauth_state.dart';

class PhoneauthCubit extends Cubit<PhoneauthState> {
  PhoneauthCubit({required this.auth})
      : super(const PhoneauthState(status: Status.initial));

  final FirebaseAuth auth;
  String verificationId = "";

  Future<void> getOtp(String phone) async {
    await auth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (phoneAuthCredential) async {
        await auth
            .signInWithCredential(phoneAuthCredential)
            .whenComplete(() => log("Loggin successfull"));
      },
      verificationFailed: (error) {
        log(error.toString());
      },
      codeSent: (_verificationId, forceResendingToken) {
        verificationId = _verificationId;
        log(verificationId);
        emit(const PhoneauthState(status: Status.sent));
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }

  Future<void> verifyOtp(String code) async {
    PhoneAuthCredential _credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: code);

    await auth.signInWithCredential(_credential);
    emit(const PhoneauthState(status: Status.verified));
  }
}
