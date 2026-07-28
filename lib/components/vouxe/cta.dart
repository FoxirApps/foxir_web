import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/theme.dart';
import 'store_buttons.dart';

/// Closing premium tagline band with store buttons.
class Cta extends StatelessComponent {
  const Cta({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'download', classes: 'cta', [
      div(classes: 'container cta-inner', [
        h2([
          .text(
            'A premium challenge app for building discipline, tracking progress, '
            'and turning consistency into proof.',
          ),
        ]),
        const StoreButtons(),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.vouxe .cta', [
      css('&').styles(padding: .symmetric(vertical: 72.px)),
      css('.cta-inner').styles(
        display: .flex,
        maxWidth: 800.px,
        margin: .symmetric(horizontal: Unit.auto),
        padding: .all(40.px),
        border: const Border.all(style: .solid, color: vouxeHairline, width: Unit.pixels(1)),
        radius: .circular(28.px),
        flexDirection: .column,
        alignItems: .center,
        gap: .all(28.px),
        textAlign: .center,
        backgroundColor: vouxeSurface,
        raw: {
          'background-image': 'radial-gradient(ellipse 80% 70% at 50% 0%, rgba(200, 240, 0, 0.16), transparent 65%)',
        },
      ),
      css('h2').styles(
        color: vouxeInk,
        fontSize: 1.5.rem,
        fontWeight: .w700,
        lineHeight: 1.3.em,
        letterSpacing: (-0.02).em,
      ),
    ]),
    css.media(desktop, [
      css('.vouxe .cta', [
        css('&').styles(padding: .symmetric(vertical: 96.px)),
        css('.cta-inner').styles(padding: .all(56.px)),
        css('h2').styles(fontSize: 1.875.rem),
      ]),
    ]),
  ];
}
