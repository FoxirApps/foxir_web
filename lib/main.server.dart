/// The entrypoint for the **server** environment.
///
/// The [main] method is executed on the server during pre-rendering.
/// The site is fully static: no client-side Dart is shipped.
library;

import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';

import 'app.dart';
import 'constants/theme.dart';

// This file is generated automatically by Jaspr, do not remove or edit.
import 'main.server.options.dart';

void main() {
  Jaspr.initializeApp(
    options: defaultServerOptions,
  );

  runApp(
    Document(
      title: 'Foxir Apps — Home to the Apps We Craft',
      lang: 'en',
      meta: {
        'description':
            'Foxir Apps is home to the products we craft in-house—Paximus, Vouxe, Better Today, and more. Explore our apps, and if you have an idea, let\'s talk.',
        'theme-color': '#0d0d0d',
      },
      styles: [
        css.import(
          'https://fonts.googleapis.com/css2?family=Quicksand:wght@400;500;600;700'
          '&family=Space+Grotesk:wght@400;500;600;700&display=swap',
        ),
        css('*, *::before, *::after').styles(
          padding: .zero,
          margin: .zero,
          boxSizing: .borderBox,
        ),
        css('html').styles(raw: {'scroll-behavior': 'smooth'}),
        css('body').styles(
          minHeight: 100.vh,
          color: foxirInk,
          fontFamily: const .list([FontFamily('Quicksand'), FontFamilies.sansSerif]),
          backgroundColor: foxirBg,
          lineHeight: 1.6.em,
        ),
        css('img').styles(display: .block, maxWidth: 100.percent),
        css('a').styles(
          color: Color.inherit,
          textDecoration: const TextDecoration(line: .none),
        ),
        // Shared page-width wrapper.
        css('.container').styles(
          width: 100.percent,
          maxWidth: contentMaxWidth,
          padding: .symmetric(horizontal: 24.px),
          margin: .symmetric(horizontal: Unit.auto),
        ),
      ],
      head: [
        link(id: 'site-favicon', rel: 'icon', type: 'image/png', href: foxirFaviconSrc),
        script(
          content:
              'window.va = window.va || function () { '
              '(window.vaq = window.vaq || []).push(arguments); '
              '};',
        ),
        script(src: '/_vercel/insights/script.js', defer: true),
      ],
      body: App(),
    ),
  );
}
