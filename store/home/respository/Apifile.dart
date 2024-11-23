import "dart:convert";

import "package:http/http.dart" as http;

String mainUrl='http://192.168.02.137:12345';


Future<dynamic> getMethod()async{
  String endpoint="/getScriptMasterDetails";

  try{
    http.Response response = await http.get(Uri.parse("$mainUrl$endpoint"));

    if (response.statusCode==200){
      return jsonDecode(response.body);
    }else{
      return "StatusCode: ${response.statusCode}";
    }
  }catch(e){
    return "Exception: $e";
  }
}


Future <dynamic> postRegisterMethod(Map data)async{
  String endpoint= "/postClientDetails";

  try {
    http.Response response= await http.post(Uri.parse("$mainUrl$endpoint"),body: jsonEncode(data));
    if (response.statusCode==200) {

      return jsonDecode(response.body);
    }else{
      return "StatusCode: ${response.statusCode}";
    }
  } catch (e) {
    return "Exception:$e";
  }
}

Future <dynamic> getLoginMethod(Map data)async{
  String endpoint="/verifyClientDetails";

  try{
    http.Response response = await http.get(Uri.parse("$mainUrl$endpoint"));

    if (response.statusCode==200){
      return jsonDecode(response.body);
    }else{
      return "StatusCode: ${response.statusCode}";
    }
  }catch(e){
    return "Exception: $e";
  }
}