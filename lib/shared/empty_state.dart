import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class EmptyStateWidget extends StatelessWidget {
  final String? categoryName;
  const EmptyStateWidget({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LottieBuilder.asset(
          'assets/lotties/empty_list.json',
          height: 200,
          width: 200,
          fit: BoxFit.cover,
        ),
        Text(
          'No $categoryName found',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 10),
        Text(
          'Tap the + button to add a new $categoryName.',
          style: TextStyle(fontSize: 14, color: Color(0xFF666666)),
        ),
      ],
    );
  }
}
