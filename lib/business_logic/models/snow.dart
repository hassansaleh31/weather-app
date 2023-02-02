import 'package:equatable/equatable.dart';

/// Snow Conditions
class Snow extends Equatable {
  /// Snow volume for the last 1 hour, mm
  final double oneHour;

  /// Snow volume for the last 3 hours, mm
  final double threeHour;

  /// Creates a new [Snow] Instance
  Snow({
    required this.oneHour,
    required this.threeHour,
  });

  @override
  List<Object?> get props => [
        oneHour,
        threeHour,
      ];

  /// Returns a copy of the snow data modified by the provided data.
  Snow copyWith(
    double? oneHour,
    double? threeHour,
  ) {
    return Snow(
      oneHour: oneHour ?? this.oneHour,
      threeHour: threeHour ?? this.threeHour,
    );
  }
}
