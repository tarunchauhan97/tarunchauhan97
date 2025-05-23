import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tarundevindia/config/constants/constants.dart';
import 'package:tarundevindia/common/responsive/responsive.dart';
import 'package:tarundevindia/config/theme/themes.dart';
import 'package:tarundevindia/provider/language_provider.dart';
import 'package:tarundevindia/ui/home/home.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TarunDevIndiaApp extends ConsumerWidget {
  const TarunDevIndiaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(languageProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: createLightTheme(currentLocale),
      home: const SafeArea(
        child: HomeScreen(),
      ),

      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: kSupportedLocales,
      locale: currentLocale,
      color: Colors.black,
      builder: (context, child) {
        return WebsiteScreen(
          mediaQueryData: MediaQuery.of(context),
          child: child!,
        );
      },
    );
  }
}
