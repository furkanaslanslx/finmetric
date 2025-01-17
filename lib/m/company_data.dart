class CompanyData {
  final String name;
  final double targetPrice;
  final double returnPotential;
  final String? aciklanmaTarihi; // Nullable field
  final String? aciklananDonem; // Nullable field

  CompanyData({required this.name, required this.targetPrice, required this.returnPotential, this.aciklanmaTarihi, this.aciklananDonem});
}
