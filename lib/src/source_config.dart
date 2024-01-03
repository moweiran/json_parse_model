class JsonSourceConfig {
  final String api;
  final String className;
  final String outpath;
  final Map<String, dynamic>? source;
  JsonSourceConfig({
    required this.api,
    required this.className,
    required this.outpath,
    this.source,
  });

  factory JsonSourceConfig.fromJson(Map<String, dynamic> json) {
    return JsonSourceConfig(
      api: json['api'] ?? '',
      className: json['className'] ?? '',
      outpath: json['outpath'] as String,
      source: json['source'],
    );
  }
}
