import 'package:equatable/equatable.dart';

class FamilyUser extends Equatable {
  const FamilyUser({
    required this.memberno,
    required this.name,
  });

  final String? memberno;
  final String? name;

  @override
  List<Object?> get props => [
    memberno,
    name,
  ];
}
