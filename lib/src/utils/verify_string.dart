bool isMailValid(String correo) {
  // Expresión regular para verificar la validez de la dirección de correo electrónico.
  final regex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

  return regex.hasMatch(correo);
}