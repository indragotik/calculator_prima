import 'package:flutter/widgets.dart';

class CalculatorProvider with ChangeNotifier {

  // int _angka1 = 0;
  // int _angka2 = 0;
  TextEditingController _angka1 = TextEditingController();
  TextEditingController _angka2 = TextEditingController();

  String _hasil = "";
  String _selectOperator;
  List<String> _listOperator = [
    "+","-","x","/"
  ];
  List<String> _listPrima = [];

  // int get angka1 => _angka1;
  // int get angka2 => _angka2;
  TextEditingController get angka1 => _angka1;
  TextEditingController get angka2 => _angka2;

  String get hasil => _hasil;
  String get selectOperator => _selectOperator;
  List<String> get listOperator => _listOperator;
  List<String> get listPrima => _listPrima;

  set angka1(TextEditingController val) {
    _angka1 = val;
    notifyListeners();
  }

  set angka2(TextEditingController val) {
    _angka2 = val;
    notifyListeners();
  }

  set hasil(String val) {
    _hasil = val;
    notifyListeners();
  }

  set listOperator(List<String> val) {
    _listOperator = val;
    notifyListeners();
  }

  set selectOperator(String val) {
    _selectOperator = val;
    notifyListeners();
  }

  set listPrima(List<String> val) {
    _listPrima = val;
    notifyListeners();
  }

  void clear() {
    angka1.text = "";
    angka2.text = "";
    selectOperator = null;
    hasil = "";
    listPrima = [];
    notifyListeners();
  }

  void hitung() {
    switch (selectOperator) {
      case "+":
        hasil = (int.parse(angka1.text) + int.parse(angka2.text)).toString();
        // cekPrima1(int.parse(hasil));
        cekPrima(int.parse(angka1.text), int.parse(angka2.text), int.parse(hasil));
        break;
      case "-":
        hasil = (int.parse(angka1.text) - int.parse(angka2.text)).toString();
        cekPrima(int.parse(angka1.text), int.parse(angka2.text), int.parse(hasil));
        break;
      case "x":
        hasil = (int.parse(angka1.text) * int.parse(angka2.text)).toString();
        cekPrima(int.parse(angka1.text), int.parse(angka2.text), int.parse(hasil));
        break;
      case "/":
        hasil = (int.parse(angka1.text) / int.parse(angka2.text)).toString();
        cekPrima(int.parse(angka1.text), int.parse(angka2.text), int.parse(hasil));
        break;
      default:
    }
    notifyListeners();
  }

  void cekPrima(int angka1, int angka2, int hasil){
    if(cekPrima1(angka1)){
      listPrima.add(angka1.toString());
    }
    if(cekPrima1(angka2)){
      listPrima.add(angka2.toString());
    }
    if(cekPrima1(hasil)){
      listPrima.add(hasil.toString());
    }
    notifyListeners();
  }

  bool cekPrima1(int angka) {
    String isi = "";
    // for (int i=1; i <= angka ; i++) {     // for 1, adalah bilangan yang akan di cek
      int t = 0; 
        for (int j=1; j <= angka ; j++) {  // for 2, bilangan pembagi
          if (angka % j == 0) {
            t++;
          }
        }

      if (t == 2) {   // syarat atau kondisi bilangan prima
        isi = angka.toString()+",";
      }
    // }
    print(isi);
    return isi!=""? true : false;
  }
}