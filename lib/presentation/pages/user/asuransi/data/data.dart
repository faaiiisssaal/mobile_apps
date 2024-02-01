

class InsuranceDataPage {
  final String name;
  final String effective;
  final String memberactive;
  final String plan;
  final String terms;
  final String policyfee;

  InsuranceDataPage({
    required this.name,
    required this.effective,
    required this.memberactive,
    required this.plan,
    required this.terms,
    required this.policyfee,
  });

  factory InsuranceDataPage.fromJson(Map<String, dynamic> json) {
    return InsuranceDataPage(
      name: json['name'],
      effective: json['EP'],
      memberactive: json['AM'],
      plan: json['P'],
      terms: json['TNC'],
      policyfee: json['FP'],
    );
  }
}

class Policy {
  final String policyNo;
  final List<InsuranceDataPage> details;

  Policy({
    required this.policyNo,
    required this.details,
  });

  factory Policy.fromJson(Map<String, dynamic> json) {
    List<dynamic> detailsJson = json['details'];
    List<InsuranceDataPage> policyDetails =
    detailsJson.map((detail) => InsuranceDataPage.fromJson(detail)).toList();

    return Policy(
      policyNo: json['policy_no'],
      details: policyDetails,
    );
  }
}

class Policies {
  final List<Policy> policies;

  Policies({required this.policies});

  factory Policies.fromJson(Map<String, dynamic> json) {
    List<dynamic> policiesJson = json['policies'];
    List<Policy> policies =
    policiesJson.map((policy) => Policy.fromJson(policy)).toList();

    return Policies(policies: policies);
  }
}

