import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tarundevindia/provider/tagged_list_provider.dart';

final class TaggedBarWidget extends ConsumerWidget {
  const TaggedBarWidget({
    super.key,
    required this.tag,
    required this.child,
  });

  final Widget child;
  final String tag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      key: ref.watch(taggedListNotifierProvider.notifier).generateItemKey(tag),
      child: child,
    );
  }
}
