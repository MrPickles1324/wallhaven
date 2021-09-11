class SettingsRepository {
  SettingsRepository({required this.downloadDir});
  final String downloadDir;

  static SettingsRepository get defaults => SettingsRepository(
        downloadDir: "storage/emulated/0/Download/",
      );
}
