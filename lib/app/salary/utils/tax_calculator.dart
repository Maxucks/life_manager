abstract class TaxCalculator {
  double calculate(double value);
}

class NDFLCalculator implements TaxCalculator {
  const NDFLCalculator();

  static const fiveMillion = 5000000000;

  static const defalutTax = 0.13;
  static const double highTax = 0.15;

  double get _afterDefaultTax => 1 - defalutTax;
  double get _afterHighTax => 1 - highTax;

  @override
  double calculate(double value) {
    if (value > fiveMillion) {
      return fiveMillion * _afterDefaultTax +
          (value - fiveMillion) * _afterHighTax;
    } else {
      return value * _afterDefaultTax;
    }
  }
}
