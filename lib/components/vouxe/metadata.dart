import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';

import '../../constants/theme.dart';

const vouxePageTitle = 'Vouxe: Challenge Tracker for Habits & Discipline';
const vouxePageDescription =
    'Vouxe is a challenge tracker for building discipline with daily check-ins, '
    'streaks, XP, badges, leaderboards, and milestone posters on iPhone and Android.';
const vouxeCanonicalUrl = 'https://foxirapps.co/vouxe';
const vouxeOgImageUrl = 'https://foxirapps.co/images/vouxe-og.png';
const vouxeOgImageAlt = 'Vouxe challenge tracker showing a completed challenge, daily streak, and leaderboard';

/// Page-specific search, social sharing, and app metadata for `/vouxe`.
class VouxeMetadata extends StatelessComponent {
  const VouxeMetadata({super.key});

  @override
  Component build(BuildContext context) {
    return Document.head(
      title: vouxePageTitle,
      meta: const {'description': vouxePageDescription},
      children: [
        link(rel: 'canonical', href: vouxeCanonicalUrl),
        meta(attributes: const {'property': 'og:type'}, content: 'website'),
        meta(attributes: const {'property': 'og:site_name'}, content: 'Vouxe'),
        meta(attributes: const {'property': 'og:title'}, content: vouxePageTitle),
        meta(
          attributes: const {'property': 'og:description'},
          content: vouxePageDescription,
        ),
        meta(attributes: const {'property': 'og:url'}, content: vouxeCanonicalUrl),
        meta(attributes: const {'property': 'og:image'}, content: vouxeOgImageUrl),
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
          content: vouxeOgImageAlt,
        ),
        meta(name: 'twitter:card', content: 'summary_large_image'),
        meta(name: 'twitter:title', content: vouxePageTitle),
        meta(name: 'twitter:description', content: vouxePageDescription),
        meta(name: 'twitter:image', content: vouxeOgImageUrl),
        meta(name: 'twitter:image:alt', content: vouxeOgImageAlt),
        script(
          id: 'vouxe-structured-data',
          attributes: const {'type': 'application/ld+json'},
          content:
              '''
{
  "@context": "https://schema.org",
  "@type": "MobileApplication",
  "name": "Vouxe",
  "url": "$vouxeCanonicalUrl",
  "description": "$vouxePageDescription",
  "applicationCategory": "LifestyleApplication",
  "operatingSystem": "iOS, Android",
  "downloadUrl": [
    "$vouxeAppStoreUrl",
    "$vouxePlayStoreUrl"
  ],
  "sameAs": [
    "$vouxeAppStoreUrl",
    "$vouxePlayStoreUrl"
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
