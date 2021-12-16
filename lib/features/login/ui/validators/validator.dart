String emailValidator(String email){
  final RegExp exp = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
  if (exp.hasMatch(email)){
    return null;
  }
  return "invalid_email";
}

String usernameValidator(String username){
  if(username != null && username.length > 2){
    return null;
  }
  return "invalid_username";
}


String passwordValidator(String password){
  final RegExp reg = RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$");
  if(reg.hasMatch(password)){
    return null;
  }
  return "invalid_password\nEn az sekiz karakter, en az bir harf ve bir rakam";
}