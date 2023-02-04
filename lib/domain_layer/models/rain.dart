import 'package:equatable/equatable.dart';

/// Rain Conditions
class Rain extends Equatable {
  /// Rain volume for the last 1 hour, mm
  final double oneHour;

  /// Rain volume for the last 3 hours, mm
  final double threeHour;

  /// Creates a new [Rain] Instance
  Rain({
    required this.oneHour,
    required this.threeHour,
  });

  @override
  List<Object?> get props => [
        oneHour,
        threeHour,
      ];

  /// Returns a copy of the rain data modified by the provided data.
  Rain copyWith(
    double? oneHour,
    double? threeHour,
  ) {
    return Rain(
      oneHour: oneHour ?? this.oneHour,
      threeHour: threeHour ?? this.threeHour,
    );
  }
}
