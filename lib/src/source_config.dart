class JsonSourceConfig {
  final String api;
  final String className;
  final String outpath;
  JsonSourceConfig({
    required this.api,
    required this.className,
    required this.outpath,
  });

  factory JsonSourceConfig.fromJson(Map<String, dynamic> json) {
    return JsonSourceConfig(
      api: json['api'] ?? '',
      className: json['className'] ?? '',
      outpath: json['outpath'] as String,
    );
  }
}
