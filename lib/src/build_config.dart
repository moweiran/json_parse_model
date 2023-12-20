class JsonBuildConfig {
  final String host;
  final String token;
  JsonBuildConfig({required this.host, required this.token});

  factory JsonBuildConfig.fromJson(Map<String, dynamic> json) =>
      JsonBuildConfig(
        host: json['host'] as String,
        token: json['token'] as String,
      );
}
