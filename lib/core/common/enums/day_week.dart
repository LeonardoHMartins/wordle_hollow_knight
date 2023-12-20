enum DayWeek {
  seg,
  ter,
  qua,
  qui,
  sex,
  sab,
  dom;

  String get name {
    switch (this) {
      case DayWeek.seg:
        return 'Segunda-feira';
      case DayWeek.ter:
        return 'Terça-feira';
      case DayWeek.qua:
        return 'Quarta-feira';
      case DayWeek.qui:
        return 'Quinta-feira';
      case DayWeek.sex:
        return 'Sexta-feira';
      case DayWeek.sab:
        return 'Sábado';
      case DayWeek.dom:
        return 'Domingo';
      default:
        throw Exception('Algo deu errado: $this');
    }
  }

  factory DayWeek.fromName(int day) {
    switch (day) {
      case 1:
        return DayWeek.seg;
      case 2:
        return DayWeek.ter;
      case 3:
        return DayWeek.qua;
      case 4:
        return DayWeek.qui;
      case 5:
        return DayWeek.sex;
      case 6:
        return DayWeek.sab;
      case 7:
        return DayWeek.dom;
      default:
        throw Exception('Algo deu errado: $day');
    }
  }
}
