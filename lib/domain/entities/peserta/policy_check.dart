import 'package:equatable/equatable.dart';

class PolicyCheck extends Equatable {
  const PolicyCheck({
    required this.effectiveDate,
    required this.renewalDate,
    required this.policyID,
    required this.clientID,
  });

  final String? effectiveDate;
  final String? renewalDate;
  final String? policyID;
  final String? clientID;

  @override
  List<Object?> get props => [
    effectiveDate,
    renewalDate,
    policyID,
    clientID
  ];
}
