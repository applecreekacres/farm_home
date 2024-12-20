import 'package:flutter/material.dart';

class FutureWidget<T> extends StatelessWidget {
  final Future<T> future;
  final Widget Function()? onLoading;
  final Widget Function(T?) onData;
  final Widget Function(dynamic)? onError;

  const FutureWidget({
    super.key,
    required this.future,
    required this.onData,
    this.onError,
    this.onLoading,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
        if (snapshot.hasError) {
          return this._handleError(snapshot.error);
        } else {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              return this._handleLoading();
            case ConnectionState.done:
              return this._handleData(snapshot.data);
          }
        }
      },
    );
  }

  Widget _handleData(T? data) {
    return this.onData(data);
  }

  Widget _handleError(dynamic error) {
    return this.onError != null ? this.onError!(error) : Container();
  }

  Widget _handleLoading() {
    return this.onLoading != null
        ? this.onLoading!()
        : Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
  }
}
