import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';

import '../../constants/theme.dart';

const betterTodayPageTitle = 'Better Today?: Daily Self-Improvement & Reflection App';
const betterTodayPageDescription =
    'Better Today? is a daily self-improvement app built around one honest '
    'question. Reflect in seconds, build consistency, and see your growth over time.';
const betterTodayCanonicalUrl = 'https://foxirapps.co/bettertoday';
const betterTodayOgImageUrl = 'https://foxirapps.co/images/bettertoday-og.png';
const betterTodayOgImageAlt =
    'Better Today daily reflection app with the message One honest question. A lifetime of growth.';

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
        meta(attributes: const {'property': 'og:image'}, content: betterTodayOgImageUrl),
        meta(
          attributes: const {'property': 'og:image:width'},
          content: '1200',
        ),
        meta(
          attributes: const {'property': 'og:image:height'},
          content: '630',
        ),
        meta(
          attributes: const {'property': 'og:image:alt'},
          content: betterTodayOgImageAlt,
        ),
        meta(name: 'twitter:card', content: 'summary_large_image'),
        meta(name: 'twitter:title', content: betterTodayPageTitle),
        meta(name: 'twitter:description', content: betterTodayPageDescription),
        meta(name: 'twitter:image', content: betterTodayOgImageUrl),
        meta(name: 'twitter:image:alt', content: betterTodayOgImageAlt),
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
  "applicationCategory": "HealthApplication",
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
  ],
  "offers": {
    "@type": "Offer",
    "price": "0",
    "priceCurrency": "USD"
  }
}
''',
        ),
      ],
    );
  }
}
