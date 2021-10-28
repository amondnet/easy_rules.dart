/// A class representing a named fact. Facts have unique names within a {@link Facts}
/// instance.
///
/// [T] type of the fact
/// @author Minsu Lee
class Fact<T> {
  final String name;
  final T value;

  /// Create a new fact.
  /// [name] of the fact
  /// [value] of the fact
  Fact(this.name, this.value);

  @override
  String toString() {
    return 'Fact{name: $name, value: $value}';
  }

  /*
	 * The Facts API represents a namespace for facts where each fact has a unique name.
	 * Hence, equals/hashcode are deliberately calculated only on the fact name.
	 */
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Fact && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;
}
