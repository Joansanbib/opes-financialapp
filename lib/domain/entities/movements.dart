class Movements {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Movements(this.id, this.title, this.amount, this.date);

  @override
  String toString() {
    return 'Movements {id: $id, name: $title value: $amount, date : $date}';
  }
}