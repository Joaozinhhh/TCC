class Validator {
  Validator._();

  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Esse campo não pode ser vazio.";
    }
    final condition = RegExp(r"^[A-Za-zÀ-ÿ\s]{2,}$");
    if (!condition.hasMatch(value.trim())) {
      return "Nome inválido. Digite um nome válido.";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    final condition = RegExp(
      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?",
    );
    if (value != null && value.isEmpty) {
      return "Esse campo não pode ser vazio.";
    }
    if (value != null && !condition.hasMatch(value)) {
      return "Email inválido. Digite um email válido.";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    final condition = RegExp(
      r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$",
    );
    if (value != null && value.isEmpty) {
      return "Esse campo não pode ser vazio.";
    }
    if (value != null && !condition.hasMatch(value)) {
      return "Senha inválida. Digite uma senha válida.";
    }
    return null;
  }

  static String? validateConfirmPassword(String? first, String? second) {
    if (first != second) {
      return "As senhas são diferentes. Por favor, corrija para continuar.";
    }
    return null;
  }
}
//regexr.com 