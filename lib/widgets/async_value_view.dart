import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

class AsyncValueView<T> extends StatelessWidget {
  final AsyncValue<T> value;
  final Widget Function(T data) onData;
  final Widget Function()? onLoading;
  final Widget Function(Object error)? onError;

  const AsyncValueView({
    super.key,
    required this.value,
    required this.onData,
    this.onLoading,
    this.onError,
  });

  @override
  Widget build(BuildContext context) {
    return value.when(
      skipLoadingOnReload: true,
      loading: () => onLoading != null
          ? onLoading!()
          : const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => onError != null
          ? onError!(error)
          : const Text('Failed to load items'),
      data: onData,
    );
  }
}
