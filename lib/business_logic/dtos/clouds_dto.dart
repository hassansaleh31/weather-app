import '../networking/json_parser.dart';

/// A data structure object representing the clouds
class CloudsDTO {
  /// Cloudiness, %
  final int? all;

  /// Creates a new [WindDTO].
  CloudsDTO({
    this.all,
  });

  /// Creates a [CloudsDTO] from the supplied JSON object
  factory CloudsDTO.fromJson(Map<String, dynamic> json) {
    return CloudsDTO(
      all: parseInt(json['all']),
    );
  }
}
