import 'package:equatable/equatable.dart';

class ClaimListUser extends Equatable {
  const ClaimListUser({
    required this.cno,
    required this.benefitName,
    required this.verified,
    required this.accepted,
    required this.bLimit,
    required this.accepted1,
    required this.excess,
  });

  final String? cno;
  final String? benefitName;
  final String? verified;
  final String? accepted;
  final String? bLimit;
  final String? accepted1;
  final int? excess;

  @override
  List<Object?> get props => [cno, benefitName, verified, accepted, bLimit, accepted1, excess];
}
