import 'package:flutter/material.dart';

class Thumbnail extends StatelessWidget {

  final String src;

  const Thumbnail({super.key, required this.src});

  @override
  Widget build(BuildContext context) => Image.network(
    src,
    loadingBuilder: (context, child, loadingProgress) {
      if (loadingProgress == null) return child;
      return Expanded(child: Container(
        color: Colors.grey[300],
        child: const Center(
          child: CircularProgressIndicator()
        )
      ));
    },
    errorBuilder: (context, error, stackTrace) {
      return Expanded(child: Container(
        color: Colors.grey[300],
        child: const Center(
          child: Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 32
          ),
        ),
      ));
    },
  );
}