import 'package:http/http.dart' as http;
import 'package:project_covid_vn/models/vn_vaccine_distribution.dart';
class VnVaccineDistribution{
  static final baseUrl="https://api-kent.netlify.app/.netlify/functions/api/vn/vaccines/distribution";
  static Future<VaccineDistribution> getVnVaccineDistribution() async{
    final url=Uri.parse(baseUrl);
    final respone=await http.get(url);
    if(respone.statusCode==200){
      final VaccineDistribution result=vaccineDistributionFromJson(respone.body);
      print(result);
      return result;
    }
    else{
      return throw("error");
    }
  }
}