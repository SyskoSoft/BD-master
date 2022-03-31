import 'package:flutter/material.dart';

class LoadingProgress extends StatelessWidget {
  const LoadingProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white.withOpacity(0.8),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [_getLoadingIndicator(), _getHeading()]));
  }

  Widget _getLoadingIndicator() {
    return const Padding(
        child: SizedBox(
            child: CircularProgressIndicator(strokeWidth: 3),
            width: 32,
            height: 32),
        padding: EdgeInsets.only(bottom: 16));
  }

  Widget _getHeading() {
    return const Padding(
        child: Text(
          'Please wait …',
          style: TextStyle(color: Colors.black, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        padding: EdgeInsets.only(bottom: 4));
  }

  Widget _getText(String displayedText) {
    return Text(
      displayedText,
      style: const TextStyle(color: Colors.white, fontSize: 14),
      textAlign: TextAlign.center,
    );
  }
}
