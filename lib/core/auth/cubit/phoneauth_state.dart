part of 'phoneauth_cubit.dart';

enum Status {
  initial,
  loding,
  sending,
  sent,
  verified,
  error,
}

class PhoneauthState extends Equatable {
  const PhoneauthState({required this.status});

  final Status status;

  @override
  List<Object> get props => [status];
}
