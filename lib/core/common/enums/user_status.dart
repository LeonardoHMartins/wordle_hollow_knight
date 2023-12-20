enum UserStatus {
  parado,
  emDeslocamento,
  chegadaNoLocal,
  executando,
  finalizou;

  String get valueSend {
    switch (this) {
      case UserStatus.parado:
        return 'Em deslocamento';
      case UserStatus.emDeslocamento:
        return 'Chegada no local';
      case UserStatus.chegadaNoLocal:
        return 'Executando';
      case UserStatus.executando:
        return 'Finalizou';
      case UserStatus.finalizou:
        return 'Parado';
      default:
        throw Exception('Algo deu errado: $this');
    }
  }

  String get value {
    switch (this) {
      case UserStatus.parado:
        return 'Parado';
      case UserStatus.emDeslocamento:
        return 'Em deslocamento';
      case UserStatus.chegadaNoLocal:
        return 'Chegada no local';
      case UserStatus.executando:
        return 'Executando';
      case UserStatus.finalizou:
        return 'Finalizou';
      default:
        throw Exception('Algo deu errado: $this');
    }
  }

  factory UserStatus.fromValue(String name) {
    switch (name) {
      case 'Parado':
        return UserStatus.parado;
      case 'Em deslocamento':
        return UserStatus.emDeslocamento;
      case 'Chegada no local':
        return UserStatus.chegadaNoLocal;
      case 'Executando':
        return UserStatus.executando;
      case 'Finalizou':
        return UserStatus.finalizou;
      default:
        throw Exception('Algo deu errado: $name');
    }
  }
}
