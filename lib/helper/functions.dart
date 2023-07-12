
bool isValidEmail(email)
{
  return RegExp(
      r"^([a-zA-Z0-9._+-]+)(@[a-zA-Z0-9-]+)(.[a-zA-Z]{2,4}){2,}$")
      .hasMatch(email) ;

}

bool isValidPassword(String value){
  String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}