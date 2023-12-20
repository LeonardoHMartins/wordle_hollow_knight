enum AuthType {
  whatsapp,
  email;

  String get value {
    switch (this) {
      case AuthType.whatsapp:
        return 'whatsapp';
      case AuthType.email:
        return 'email';
      default:
        throw Exception('Algo deu errado: $this');
    }
  }
}
