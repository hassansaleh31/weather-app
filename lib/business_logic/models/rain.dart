import 'package:equatable/equatable.dart';

/// Rain Conditions
class Rain extends Equatable {
  /// Rain volume for the last 1 hour, mm
  final double oneHour;

  /// Rain volume for the last 3 hours, mm
  final double threeHours;

  /// Creates a new [Rain] Instance
  Rain({
    required this.oneHour,
    required this.threeHours,
  });

  @override
  List<Object?> get props => [
        oneHour,
        threeHours,
      ];

  /// Returns a copy of the rain data modified by the provided data.
  Rain copyWith(
    double? oneHour,
    double? threeHours,
  ) {
    return Rain(
      oneHour: oneHour ?? this.oneHour,
      threeHours: threeHours ?? this.threeHours,
    );
  }
}
