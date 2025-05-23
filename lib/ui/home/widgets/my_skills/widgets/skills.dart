import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tarundevindia/config/theme/app_colors.dart';
import 'package:tarundevindia/ui/home/widgets/my_skills/widgets/skills_section.dart';

class Skills extends StatelessWidget {
  const Skills({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return SkillsSection(
      title: localization.skills,
      description: localization.skillsDescription,
      child: const Wrap(
        alignment: WrapAlignment.start,
        children: [
          SkillLabel(label: 'Dart'),
          SkillLabel(label: 'Flutter'),
          SkillLabel(label: 'Firebase'),
          SkillLabel(label: 'Android Kotlin'),
          SkillLabel(label: 'Swift UI'),
          SkillLabel(label: 'Bloc,Riverpod, Getx State Managements'),
          SkillLabel(label: 'Clean & MVC Architecture'),
          SkillLabel(label: 'SOLID Principles'),
          SkillLabel(label: 'Design Patterns'),
          SkillLabel(label: 'Restful Api'),
          SkillLabel(label: 'Git,Github, Azure, Bitbucket'),
          SkillLabel(label: 'Animations'),
          SkillLabel(label: 'Responsive UI'),
          SkillLabel(label: 'Spring Boot'),
          SkillLabel(label: 'Nodejs'),
          SkillLabel(label: 'SQL'),
          SkillLabel(label: 'NoSQL'),
          SkillLabel(label: 'Method Channels'),
          SkillLabel(label: 'Push Notifications'),
          SkillLabel(label: 'Razerpay/Paypal'),
        ],
      ),
    );
  }
}

class SkillLabel extends StatelessWidget {
  const SkillLabel({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      constraints: const BoxConstraints(minWidth: 80),
      decoration: BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.secondary,
        ),
        gradient: LinearGradient(
          colors: [
            theme.primaryColorLight,
            theme.primaryColorDark,
          ],
        ),
        // color: Colors.lightBlue.shade50,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: theme.textTheme.titleMedium!.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
