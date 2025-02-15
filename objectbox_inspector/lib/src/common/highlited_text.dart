import 'package:flutter/material.dart';

class HighlightedText extends StatelessWidget {
  final String text;
  final String? highlight;
  final TextStyle? style;

  const HighlightedText({
    super.key,
    required this.text,
    required this.highlight,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    if (highlight == null || highlight!.isEmpty) {
      return Text(
        text,
        style: style,
      );
    }

    final cs = Theme.of(context).colorScheme;
    final allCharacters = text.split('');
    final ranges = text.highlightIndexes(highlight!);
    final children = <TextSpan>[];

    for (var i = 0; i < allCharacters.length; i++) {
      final char = allCharacters[i];
      if (ranges.any((e) => e.start <= i && e.end > i)) {
        children.add(
          TextSpan(
            text: char,
            style: style?.copyWith(
              color: cs.primary,
              fontWeight: FontWeight.w900,
            ),
          ),
        );
      } else {
        children.add(TextSpan(text: char, style: style));
      }
    }
    return RichText(
      text: TextSpan(
        children: children,
      ),
    );
  }
}

class _HighlightRange {
  final int start;
  final int end;

  _HighlightRange({
    required this.start,
    required this.end,
  });

  @override
  String toString() {
    return 'HighlightRange(start: $start, end: $end)';
  }
}

extension _HighlightIndexes on String {
  List<_HighlightRange> highlightIndexes(String highlight) {
    final memo = <_HighlightRange>[];
    var copy = toLowerCase();
    final highlightCopy = highlight.toLowerCase();

    while (copy.isNotEmpty) {
      final index = copy.indexOf(highlightCopy);
      if (index == -1) break;
      final actualIndex = length - copy.length + index;
      memo.add(_HighlightRange(
        start: actualIndex,
        end: actualIndex + highlight.length,
      ));
      copy = copy.substring(index + highlight.length);
    }

    return memo;
  }
}
