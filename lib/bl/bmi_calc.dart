import 'dart:math';

class BmiCalc {
  final height;
  final weight;

  var _bmi;

  BmiCalc(this.height, this.weight) {
    _bmi = weight / pow(height / 100, 2);
  }

  String calc_bmi() {
    return _bmi.toStringAsFixed(1);
  }

  String to_text() {
    if (_bmi >= 25)
      return 'overweight';
    else if (_bmi > 18.5)
      return 'normal';
    else
      return 'underweight';
  }

  String to_desc() {
    if (_bmi >= 25)
      return 'bla bla bla overweight bla bla bla';
    else if (_bmi > 18.5)
      return 'bla bla bla normal bla bla bla';
    else
      return 'bla bla bla underweight bla bla bla';
  }
}
