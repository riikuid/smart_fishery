import 'package:flutter/material.dart';

class ErrorWarning extends StatelessWidget {
  final void Function() onRefresh;
  final String _errorMessage;

  const ErrorWarning({
    super.key,
    String? errorMessage,
    required this.onRefresh,
  }) : _errorMessage = errorMessage ?? "Gagal tersambung ke server";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.error , size: 48,),
        Text(_errorMessage),
        FilledButton(onPressed: onRefresh, child: const Text("Refresh"))
      ],
    );
  }
}
