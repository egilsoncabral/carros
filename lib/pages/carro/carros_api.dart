import 'dart:convert';

import 'package:carros/pages/carro/carro.dart';
import 'package:http/http.dart' as http;

class TipoCarro{
  static final String classicos = "classicos";
  static final String esportivos = "esportivos";
  static final String luxo = "luxo";
}

class CarrosApi{
  static Future<List<Carro>> getCarros(String tipo) async{
    var url = "https://carros-springboot.herokuapp.com/api/v1/carros/tipo/$tipo";
    var response = await http.get(url);
    List listResponse = json.decode(response.body);
    final carros = listResponse.map<Carro>((item) => Carro.fromJson(item)).toList();

    return carros;
  }
}