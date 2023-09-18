class CurrencyModel{
  final String nome;
  final double real;
  final double dolar;
  final double euro;
  final double bitcoin;

  CurrencyModel(this.nome, this.real, this.dolar, this.euro, this.bitcoin);

  static List<CurrencyModel> getCurrencies(){
    return <CurrencyModel>[
      CurrencyModel("Real", 1, 0.19 , 0.18, 0.000011),
      CurrencyModel("Dolar",5.28 , 1, 0.18, 0.000060),
      CurrencyModel("Euro", 5.64, 1.07, 1, 0.000064),
      CurrencyModel("Bitcoin", 87623.39, 16603.20, 15549.70, 1),
    ];
  }
}