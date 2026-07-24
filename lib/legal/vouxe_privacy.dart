import 'legal_document.dart';

const vouxePrivacy = LegalDocument(
  title: 'Privacy Policy for Vouxe Mobile App',
  lastUpdated: 'March 2026',
  sections: [
    LegalSection(
      heading: 'Introduction',
      blocks: [
        LegalParagraph(
          'This Privacy Policy explains how the Vouxe Mobile App (“we,” “us,” or “our”) '
          'collects, uses, maintains, and discloses information from users (“User” or “you”) '
          'of the Vouxe mobile application (“App”) and the website at '
          'https://foxirapps.co/vouxe (“Website”).',
        ),
      ],
    ),
    LegalSection(
      heading: 'Information We Collect',
      blocks: [
        LegalParagraph('We collect the following types of information:'),
        LegalParagraph(
          'Personal Information: This includes information you provide when creating an '
          'account or using the App, such as:',
        ),
        LegalBullets([
          'Name',
          'Email address',
          'Phone number (if provided)',
          'Billing and subscription data (processed via App Store, Google Play, or RevenueCat)',
          'Challenges you create',
          'Daily progress entries and activity data',
          'Achievement data such as streaks, milestones, XP, and badges',
          'Authentication IDs (such as Firebase UID, Apple ID, or Google ID)',
        ]),
        LegalParagraph(
          'Non-Personal / Device Information: This includes technical information that may '
          'be collected automatically through SDKs and analytics tools such as Firebase '
          'Analytics, including:',
        ),
        LegalBullets([
          'Device model',
          'Operating system version',
          'App version',
          'Language preferences',
          'Anonymous usage analytics',
        ]),
      ],
    ),
    LegalSection(
      heading: 'How We Use Information',
      blocks: [
        LegalParagraph('We use the collected information for the following purposes:'),
        LegalParagraph('Core Functionality — Personal data is used to:'),
        LegalBullets([
          'Allow you to create challenges',
          'Track daily progress',
          'Maintain streaks and milestones',
          'Synchronize your data across devices',
        ]),
        LegalParagraph('Account and Subscription Management — Personal data may be used to:'),
        LegalBullets([
          'Process payments',
          'Verify subscription access',
          'Restore purchases for premium features',
        ]),
        LegalParagraph('App Improvement and Analytics — Non-personal data helps us:'),
        LegalBullets([
          'Analyze feature usage',
          'Improve stability and performance',
          'Enhance the overall user experience',
        ]),
        LegalParagraph('Communications — Personal data may be used to:'),
        LegalBullets([
          'Send service-related emails',
          'Respond to support requests',
          'Send optional updates',
        ]),
        LegalParagraph('We do not sell your personal information.'),
      ],
    ),
    LegalSection(
      heading: 'Legal Bases (GDPR)',
      blocks: [
        LegalParagraph(
          'We process your data based on one or more of the following legal grounds:',
        ),
        LegalBullets([
          'Your consent',
          'Performance of a contract to provide the App',
          'Our legitimate interests in improving and securing the App',
          'Compliance with legal obligations',
        ]),
      ],
    ),
    LegalSection(
      heading: 'Data Sharing',
      blocks: [
        LegalParagraph('We may share your information in the following cases:'),
        LegalParagraph(
          'Service Providers — We share data with trusted providers necessary to operate '
          'Vouxe, such as:',
        ),
        LegalBullets([
          'Firebase (hosting, authentication, analytics)',
          'RevenueCat (subscription management)',
          'Push notification services such as OneSignal',
        ]),
        LegalTerm(
          'Aggregated Statistics',
          'Non-identifiable analytics may be shared for statistical and product '
          'improvement purposes.',
        ),
        LegalTerm(
          'Legal Requirements',
          'We may disclose information if required by law, court order, or to protect '
          'our legal rights.',
        ),
      ],
    ),
    LegalSection(
      heading: 'Google API Services & Limited Use',
      blocks: [
        LegalParagraph(
          'Any data obtained through Google APIs (such as Google Sign-In) is used solely '
          'to provide Vouxe features and is handled in accordance with the Google API '
          'Services User Data Policy, including its Limited Use requirements.',
        ),
      ],
    ),
    LegalSection(
      heading: 'Security Measures',
      blocks: [
        LegalParagraph('We implement security measures to protect your data, including:'),
        LegalBullets([
          'TLS encryption for data in transit',
          'Secure storage systems',
          'Access controls designed to protect user information',
        ]),
      ],
    ),
    LegalSection(
      heading: 'Data Retention & Deletion',
      blocks: [
        LegalTerm(
          'Active Account',
          'Your data is retained as long as your account remains active to support your '
          'progress and challenge tracking.',
        ),
        LegalTerm(
          'Backups',
          'Encrypted backups may persist for up to 90 days after account deletion for '
          'disaster-recovery purposes.',
        ),
        LegalTerm(
          'Deletion Request',
          'You can delete your account at any time through the App settings or by '
          'contacting us via email. Deletion requests are processed within 30 days.',
        ),
      ],
    ),
    LegalSection(
      heading: 'Your Privacy Controls',
      blocks: [
        LegalParagraph('You have the following options to manage your data:'),
        LegalBullets([
          'Access or export your data',
          'Update personal details in the App',
          'Delete your account and associated data',
          'Disable optional communications through the App',
        ]),
      ],
    ),
    LegalSection(
      heading: 'Children’s Privacy',
      blocks: [
        LegalParagraph(
          'Vouxe is not intended for children under 13. We do not knowingly collect '
          'personal data from anyone under 13. If you believe a child has provided us '
          'with data, please contact us for removal.',
        ),
      ],
    ),
    LegalSection(
      heading: 'Changes to This Policy',
      blocks: [
        LegalParagraph(
          'We may update this Privacy Policy from time to time. The updated version will '
          'include a revised “Last updated” date. Significant changes may be communicated '
          'through the App.',
        ),
      ],
    ),
    LegalSection(
      heading: 'Contact Us',
      blocks: [
        LegalParagraph('Foxir Apps'),
        LegalParagraph('Email: foxirapps@gmail.com'),
        LegalParagraph('© 2026 Foxir Apps. All rights reserved.'),
      ],
    ),
  ],
);
