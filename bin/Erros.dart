class UsuarioNaoEncontrado implements Exception {
  String msg;

  UsuarioNaoEncontrado([this.msg = "Usuário não encontrado"]);
}

class SaldoInsuficiente implements Exception {
  String msg;

  SaldoInsuficiente([this.msg = "Saldo insuficiente"]);
}

class ErroInterno implements Exception {
  String msg;

  ErroInterno([this.msg = "Erro interno"]);

  static String mensagemErro() => "Erro interno";
}
