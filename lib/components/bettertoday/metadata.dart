import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';

import '../../constants/theme.dart';

const betterTodayPageTitle = 'Better Today?: Daily Self-Improvement & Reflection App';
const betterTodayPageDescription =
    'Better Today? is a daily self-improvement app built around one honest '
    'question. Reflect in seconds, build consistency, and see your growth over time.';
const betterTodayCanonicalUrl = 'https://foxirapps.co/bettertoday';

/// Page-specific search, social sharing, and app metadata for `/bettertoday`.
class BetterTodayMetadata extends StatelessComponent {
  const BetterTodayMetadata({super.key});

  @override
  Component build(BuildContext context) {
    return Document.head(
      title: betterTodayPageTitle,
      meta: const {'description': betterTodayPageDescription},
      children: [
        link(rel: 'canonical', href: betterTodayCanonicalUrl),
        meta(attributes: const {'property': 'og:type'}, content: 'website'),
        meta(attributes: const {'property': 'og:site_name'}, content: 'Better Today?'),
        meta(attributes: const {'property': 'og:title'}, content: betterTodayPageTitle),
        meta(
          attributes: const {'property': 'og:description'},
          content: betterTodayPageDescription,
        ),
        meta(attributes: const {'property': 'og:url'}, content: betterTodayCanonicalUrl),
        meta(name: 'twitter:card', content: 'summary'),
        meta(name: 'twitter:title', content: betterTodayPageTitle),
        meta(name: 'twitter:description', content: betterTodayPageDescription),
        meta(
          name: 'apple-itunes-app',
          content: 'app-id=6748441674, app-argument=$betterTodayCanonicalUrl',
        ),
        script(
          id: 'better-today-structured-data',
          attributes: const {'type': 'application/ld+json'},
          content:
              '''
{
  "@context": "https://schema.org",
  "@type": "MobileApplication",
  "name": "Better Today?",
  "url": "$betterTodayCanonicalUrl",
  "description": "$betterTodayPageDescription",
  "applicationCategory": "LifestyleApplication",
  "operatingSystem": "iOS, Android",
  "downloadUrl": [
    "$betterAppStoreUrl",
    "$betterPlayStoreUrl"
  ],
  "sameAs": [
    "$betterAppStoreUrl",
    "$betterPlayStoreUrl",
    "$betterTiktokUrl",
    "$betterInstagramUrl"
  ]
}
''',
        ),
      ],
    );
  }
}
