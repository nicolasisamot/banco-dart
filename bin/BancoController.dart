import "./Conta.dart";
import "Erros.dart";

void main() {
  BancoController banco = BancoController();
  Conta conta1 = Conta(1, "Nicolas", 1000);
  Conta conta2 = Conta(2, "Isadora", 2000);
  banco.criarConta(conta1);
  banco.criarConta(conta2);
  print(banco.transferir(idRemetente: 1, idDestinatario: 2, valor: 3000)
      ? "Transferencia efetuada"
      : "Transferencia nao efetuada");
}

class BancoController {
  Map<int, Conta> contas = {};

  void criarConta(Conta conta) {
    contas[conta.id] = conta;
  }

  bool transferir(
      {required int idRemetente,
      required int idDestinatario,
      required double valor}) {
    try {
      Conta? remetente = contas[idRemetente];
      if (remetente == null) {
        throw UsuarioNaoEncontrado("Remetente não encontrado");
      }

      Conta? destinatario = contas[idDestinatario];
      if (destinatario == null) {
        throw UsuarioNaoEncontrado("Destinatario não encontrado");
      }
      if (remetente.saldo < valor) {
        throw SaldoInsuficiente("O remetente não possui saldo insuficiente.");
      }

      remetente.saldo -= valor;
      destinatario.saldo += valor;

      return true;
    } on UsuarioNaoEncontrado catch (e) {
      print(e.msg);
      return false;
    } on SaldoInsuficiente catch (e) {
      print(e.msg);
      return false;
    } on Exception {
      ErroInterno.mensagemErro();
      return false;
    }
  }
}
