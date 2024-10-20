import 'package:flutter/material.dart';

class StreamWidget<T> extends StatelessWidget {
  final Stream<T> stream;
  final Widget Function()? onLoading;
  final Widget Function(T?) onData;
  final Widget Function(dynamic)? onError;

  const StreamWidget({
    required this.stream,
    required this.onData,
    this.onError,
    this.onLoading,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
        if (snapshot.hasData) {
          return this._handleData(snapshot.data);
        } else if (snapshot.hasError) {
          return this._handleError(snapshot.error);
        } else {
          return this._handleLoading();
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
    return this.onLoading != null ? this.onLoading!() : Container();
  }
}
