import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tarundevindia/common/responsive/responsive.dart';
import 'package:tarundevindia/provider/tagged_list_provider.dart';
import 'package:tarundevindia/ui/home/widgets/sliver_app_bar/widgets/change_language_menu_button.dart';
import 'package:tarundevindia/ui/home/widgets/sliver_app_bar/widgets/custom_navigation_bar.dart';

class HomeAppBar extends HookConsumerWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screen = WebsiteScreen.of(context);
    final theme = Theme.of(context);

    final animation = useState(0.0);
    final maxArea = MediaQuery.of(context).size.height - kToolbarHeight;
    final minArea = maxArea - kToolbarHeight;

    useEffect(() {
      final controller = ref.read(homeScrollControllerProvider);
      controller.addListener(
        () {
          final offset = controller.offset.clamp(minArea, maxArea);
          final minus = maxArea - offset;
          final value = minus / kToolbarHeight;
          animation.value = 1 - value;
        },
      );
      return null;
    }, const []);

    final appbarBackgroundColor = Color.lerp(
      Colors.transparent,
      Colors.white,
      animation.value,
    )!;

    final elevation = animation.value * 5;

    return Theme(
      data: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          onSurface: Colors.black,
        ),
      ),
      child: PhysicalModel(
        color: appbarBackgroundColor,
        elevation: elevation,
        child: Container(
          height: kToolbarHeight,
          padding: screen.contentPadding,
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/icons/devicon.png',
                fit: BoxFit.contain,
                width: 35,
              ),
              const SizedBox(width: 20),
              Text(
                "Tarun Singh Chauhan",
                style: theme.textTheme.headlineLarge!.copyWith(
                    fontFamily: 'SassyFrass',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 40),
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    final isSmallScreen = !screen.type.isDesktop;

                    if (isSmallScreen) {
                      return Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: IconButton(
                          onPressed: Scaffold.of(context).openEndDrawer,
                          iconSize: 35,
                          icon: const Icon(
                            Icons.menu,
                            fill: 1,
                            color: Colors.white,
                          ),
                        ),
                      );
                    }
                    return const Row(
                      children: [
                        SizedBox(width: 100),
                        Expanded(
                          child: CustomNavigationBar(),
                        ),
                        SizedBox(width: 100),
                        // ChangeLanguageMenuButton(),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
