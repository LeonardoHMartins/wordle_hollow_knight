enum OsStatus {
  pendente,
  emExecucao,
  emDeslocamento;

  String get beautyName {
    switch (this) {
      case OsStatus.pendente:
        return 'Agendado';
      case OsStatus.emDeslocamento:
        return 'Em deslocamento';
      default:
        throw Exception('Algo deu errado: $this');
    }
  }

  String get value {
    switch (this) {
      case OsStatus.pendente:
        return 'Agendado';
      case OsStatus.emDeslocamento:
        return 'Em Deslocamento';
      case OsStatus.emExecucao:
        return 'Em Execução';
      default:
        throw Exception('Algo deu errado: $this');
    }
  }

  factory OsStatus.fromValue(String name) {
    switch (name) {
      case 'Agendado':
        return OsStatus.pendente;
      case 'Em deslocamento':
        return OsStatus.emDeslocamento;
      case 'Em Deslocamento':
        return OsStatus.emDeslocamento;
      case 'Em Execução':
        return OsStatus.emExecucao;

      default:
        throw Exception('Algo deu errado: $name');
    }
  }
}
