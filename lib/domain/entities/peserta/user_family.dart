import 'package:equatable/equatable.dart';

class FamilyUser extends Equatable {
  const FamilyUser({
    required this.memberno,
    required this.plan,
  });

  final String? memberno;
  final String? plan;

  @override
  List<Object?> get props => [
    memberno,
    plan,
  ];
}
