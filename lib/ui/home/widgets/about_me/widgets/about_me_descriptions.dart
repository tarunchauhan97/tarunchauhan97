import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tarundevindia/config/constants/constants.dart';
import 'package:tarundevindia/common/responsive/responsive.dart';
import 'package:tarundevindia/config/constants/home_items_tags.dart';
import 'package:tarundevindia/provider/tagged_list_provider.dart';
import 'package:tarundevindia/provider/url_handler.dart';
import 'package:tarundevindia/ui/widgets/custom_elevated_button.dart';

class AboutMeDescriptions extends ConsumerWidget {
  const AboutMeDescriptions({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screen = WebsiteScreen.of(context);
    final localization = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    final isSmallScreen = screen.type.isMobile;
    final buttonPadding = EdgeInsets.symmetric(
      horizontal: screen.fromMTD(10, 15, 20),
      vertical: screen.fromMTD(10, 15, 15),
    );
    final aboutMeTextAlign = isSmallScreen ? TextAlign.center : TextAlign.start;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: isSmallScreen ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          localization.jobTitle,
          style: theme.textTheme.headlineSmall!.copyWith(
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          localization.myName,
          style: theme.textTheme.headlineMedium!.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: aboutMeTextAlign,
        ),
        const SizedBox(height: 10),

        Text(
          localization.aboutDescription,
          style: theme.textTheme.titleMedium?.copyWith(color: Colors.white,),
          textAlign: aboutMeTextAlign,
        ),

        const SizedBox(height: 15),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomElevatedButton(
              onPressed: () => launchUrlOnWebBrowser(kMyResumeDownloadUrl),
              padding: buttonPadding,
              gradientBackground: LinearGradient(
                colors: [
                  theme.primaryColorLight,
                  theme.primaryColorDark,
                ],
              ),
              borderRadius: BorderRadius.circular(100),

              child: Text(localization.downloadResume),
            ),
            SizedBox(width: 10),

            CustomElevatedButton(
              onPressed: () =>
                  ref.read(taggedListNotifierProvider.notifier).animateToTag(kHomeContactMeItemTag),
              // backgroundColor: Colors.white,
              // foregroundColor: theme.primaryColor,
              gradientBackground: LinearGradient(
                colors: [
                  theme.primaryColorLight,
                  theme.primaryColorDark,
                ],
              ),
              padding: buttonPadding,
              borderSide: BorderSide(
                color: theme.primaryColor,
              ),
              borderRadius: BorderRadius.circular(100),
              child: Text(localization.messageMe),
            ),
          ],
        ),
      ],
    );
  }
}
