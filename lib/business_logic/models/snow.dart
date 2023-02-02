import 'package:equatable/equatable.dart';

/// Snow Conditions
class Snow extends Equatable {
  /// Snow volume for the last 1 hour, mm
  final double oneHour;

  /// Snow volume for the last 3 hours, mm
  final double threeHours;

  /// Creates a new [Snow] Instance
  Snow({
    required this.oneHour,
    required this.threeHours,
  });

  @override
  List<Object?> get props => [
        oneHour,
        threeHours,
      ];

  /// Returns a copy of the snow data modified by the provided data.
  Snow copyWith(
    double? oneHour,
    double? threeHours,
  ) {
    return Snow(
      oneHour: oneHour ?? this.oneHour,
      threeHours: threeHours ?? this.threeHours,
    );
  }
}
