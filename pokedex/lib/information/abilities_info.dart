class Ability {
  final String name;
  final String url;
  final bool isHidden;
  final int slot;

  Ability({
    required this.name,
    required this.url,
    required this.isHidden,
    required this.slot,
  });

  factory Ability.fromJson(Map<String, dynamic> json) {
    return Ability(
      name: json['ability']['name'],
      url: json['ability']['url'],
      isHidden: json['is_hidden'],
      slot: json['slot'],
    );
  }
}
