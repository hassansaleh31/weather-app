import '../dtos/main_conditions_dto.dart';
import '../models/main_conditions.dart';

/// Extension that provides mappings for [MainConditionsDTO]
extension MainConditionsDTOMapping on MainConditionsDTO {
  /// Maps into a [MainConditions]
  MainConditions toMainConditions() {
    return MainConditions(
      temp: temp ?? 0,
      feelsLike: feelsLike ?? 0,
      tempMin: tempMin ?? 0,
      tempMax: tempMax ?? 0,
      pressure: pressure ?? 0,
      humidity: humidity ?? 0,
      seaLevel: seaLevel ?? 0,
      grndLevel: grndLevel ?? 0,
    );
  }
}
