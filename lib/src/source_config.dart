class JsonSourceConfig {
  final String api;
  final String className;
  final String outpath;
  final Map<String, dynamic>? source;
  final bool copyWith;
  JsonSourceConfig({
    required this.api,
    required this.className,
    required this.outpath,
    this.source,
    this.copyWith = false,
  });

  factory JsonSourceConfig.fromJson(Map<String, dynamic> json) {
    return JsonSourceConfig(
      api: json['api'] ?? '',
      className: json['className'] ?? '',
      outpath: json['outpath'] as String,
      source: json['source'],
      copyWith: json['copyWith'] ?? false,
    );
  }
}
