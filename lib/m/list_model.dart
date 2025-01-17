class CompanyFinancialStatus {
  final String stockName;
  final double targetPrice;
  final double returnPotential;
  final String longCompanyName;
  final double percentageGainLast24Hours;

  CompanyFinancialStatus({
    required this.stockName,
    required this.targetPrice,
    required this.returnPotential,
    required this.longCompanyName,
    required this.percentageGainLast24Hours,
  });

  factory CompanyFinancialStatus.fromJson(Map<String, dynamic> json) {
    return CompanyFinancialStatus(
      stockName: json['stockName'],
      targetPrice: json['targetPrice'],
      returnPotential: json['returnPotential'],
      longCompanyName: json['longCompanyName'],
      percentageGainLast24Hours: json['percentageGainLast24Hours'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'stockName': stockName,
      'targetPrice': targetPrice,
      'returnPotential': returnPotential,
      'longCompanyName': longCompanyName,
      'percentageGainLast24Hours': percentageGainLast24Hours,
    };
  }
}
