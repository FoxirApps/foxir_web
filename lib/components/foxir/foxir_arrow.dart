import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// Font-independent north-east arrow used across Foxir interactions.
class FoxirArrow extends StatelessComponent {
  const FoxirArrow({
    this.classes,
    super.key,
  });

  final String? classes;

  @override
  Component build(BuildContext context) {
    return svg(
      [
        path(
          [],
          d: 'M4 12L12 4M5.5 4H12V10.5',
          fill: const Color('none'),
          stroke: Color.currentColor,
          strokeWidth: '1.5',
          attributes: const {
            'stroke-linecap': 'round',
            'stroke-linejoin': 'round',
          },
        ),
      ],
      classes: 'foxir-arrow${classes == null ? '' : ' $classes'}',
      styles: const Styles(
        raw: {
          'display': 'block',
          'flex-shrink': '0',
          'overflow': 'visible',
        },
      ),
      viewBox: '0 0 16 16',
      width: 1.em,
      height: 1.em,
      attributes: const {
        'aria-hidden': 'true',
        'focusable': 'false',
      },
    );
  }
}
