import 'package:equatable/equatable.dart';

/// The cloud conditons
class Clouds extends Equatable {
  /// Cloudiness, %
  final int all;

  /// Creates a new [Clouds] Instance
  Clouds({
    required this.all,
  });

  @override
  List<Object?> get props => [all];

  /// Returns a copy of the clouds data modified by the provided data.
  Clouds copyWith(
    int? all,
  ) {
    return Clouds(
      all: all ?? this.all,
    );
  }
}
