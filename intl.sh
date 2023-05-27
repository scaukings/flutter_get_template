flutter pub run intl_generator:extract_to_arb --output-dir=i10n-arb --output-file=intl_zh_CN.arb --locale=zh_CN lib/i10n/localization_intl.dart
flutter pub run intl_generator:generate_from_arb --output-dir=lib/i10n --use-deferred-loading lib/i10n/localization_intl.dart i10n-arb/intl_zh_CN.arb i10n-arb/intl_en_US.arb
