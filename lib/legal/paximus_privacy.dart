import 'legal_document.dart';

const paximusPrivacy = LegalDocument(
  title: 'Privacy Policy for Paximus Mobile App',
  lastUpdated: '4 June 2025',
  sections: [
    LegalSection(
      heading: 'Introduction',
      blocks: [
        LegalParagraph(
          'This Privacy Policy explains how Paximus Mobile App (“we,” “us,” or “our”) '
          'collects, uses, maintains, and discloses information from users (“User” or “you”) '
          'of the Paximus mobile application (“App”) and the website at '
          'https://foxirapps.co/paximus (“Website”).',
        ),
      ],
    ),
    LegalSection(
      heading: 'Information We Collect',
      blocks: [
        LegalParagraph('We collect the following types of information:'),
        LegalTerm(
          'Personal Information',
          'This includes your name, email address, phone number, billing and subscription '
          'data (processed via App Store, Google Play, or RevenueCat), proof uploads '
          '(such as photos, short audio notes, or text notes), and authentication IDs '
          '(like Firebase UID, Apple ID, or Google ID). This information is provided '
          'directly by you during registration, purchases, or while using App features.',
        ),
        LegalTerm(
          'Non-Personal/Device Information',
          'This includes device model, operating system version, app version, language '
          'preferences, and anonymized usage analytics. These are collected automatically '
          'through the App’s SDKs and analytics tools, such as Firebase Analytics.',
        ),
      ],
    ),
    LegalSection(
      heading: 'How We Use Information',
      blocks: [
        LegalParagraph('We use the collected information for the following purposes:'),
        LegalTerm(
          'Core Functionality',
          'Personal data is used to create timestamped proof entries, display past proofs, '
          'and sync data across your devices.',
        ),
        LegalTerm(
          'Account and Subscription Management',
          'Personal data is used to process payments, verify subscription entitlements, '
          'and restore purchases.',
        ),
        LegalTerm(
          'Personalization and Wellness Insights',
          'Both personal and non-personal data are used to suggest checklists, provide '
          'end-of-day prompts, and offer breathing exercises.',
        ),
        LegalTerm(
          'App Improvement and Analytics',
          'Non-personal data is used for crash reporting and analyzing feature usage '
          'trends to improve the App.',
        ),
        LegalTerm(
          'Communications',
          'Personal data is used to send service-related emails, optional newsletters, '
          'or to provide customer support.',
        ),
        LegalParagraph('We do not sell your personal information.'),
      ],
    ),
    LegalSection(
      heading: 'Legal Bases (GDPR)',
      blocks: [
        LegalParagraph(
          'We process your data based on one or more of the following legal grounds: '
          '(a) your consent, (b) performance of a contract to provide the App, '
          '(c) our legitimate interests in ensuring App security and improvement, or '
          '(d) compliance with legal obligations.',
        ),
      ],
    ),
    LegalSection(
      heading: 'Data Sharing',
      blocks: [
        LegalParagraph('We may share your information in the following cases:'),
        LegalTerm(
          'Service Providers',
          'We share data with trusted processors necessary to operate Paximus, such as '
          'Firebase for hosting and authentication, RevenueCat for subscriptions, and '
          'OneSignal for push notifications.',
        ),
        LegalTerm(
          'Aggregated Statistics',
          'Non-identifiable analytics may be shared with partners for statistical purposes.',
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
          'Any data obtained through Google APIs (e.g., Google Sign-In) is used solely '
          'to provide Paximus features and is handled in accordance with the Google API '
          'Services User Data Policy, including its Limited Use requirements.',
        ),
      ],
    ),
    LegalSection(
      heading: 'Security Measures',
      blocks: [
        LegalParagraph('We implement the following security measures to protect your data:'),
        LegalBullets([
          'End-to-end TLS encryption for data in transit.',
          'AES-256 encryption for proof media stored in Firebase Storage.',
          'Role-based access controls and periodic security audits.',
          'Photos and audio proofs are stored in private, non-public buckets.',
        ]),
      ],
    ),
    LegalSection(
      heading: 'Data Retention & Deletion',
      blocks: [
        LegalTerm(
          'Active Account',
          'Your data is retained as long as your account remains active.',
        ),
        LegalTerm(
          'Backups',
          'Encrypted backups may persist for up to 90 days after account deletion for '
          'disaster-recovery purposes.',
        ),
        LegalTerm(
          'Deletion Request',
          'You can delete your account at any time through App Settings or by emailing us. '
          'We process email deletion requests within 30 days.',
        ),
      ],
    ),
    LegalSection(
      heading: 'Your Privacy Controls',
      blocks: [
        LegalParagraph('You have the following options to manage your data:'),
        LegalBullets([
          'Access/Export: Request a copy of your data.',
          'Correction: Update your personal details directly in the App.',
          'Deletion: Delete your data as described above.',
          'Withdraw Consent: Disable analytics and marketing emails through App Settings.',
          'Opt-Out of Cookies: Adjust browser settings on the Website (note that some features may not work without cookies).',
        ]),
      ],
    ),
    LegalSection(
      heading: 'Children’s Privacy',
      blocks: [
        LegalParagraph(
          'Paximus is not intended for children under 13. We do not knowingly collect '
          'personal data from anyone under 13. If you believe a child has provided us '
          'with data, please contact us for immediate removal.',
        ),
      ],
    ),
    LegalSection(
      heading: 'Changes to This Policy',
      blocks: [
        LegalParagraph(
          'We may update this Privacy Policy from time to time. The updated version will '
          'include a revised “Last updated” date. For significant changes, we will notify '
          'you via an in-App notice or email.',
        ),
      ],
    ),
    LegalSection(
      heading: 'Contact Us',
      blocks: [
        LegalParagraph(
          'If you have questions about this Privacy Policy or your data, please contact:',
        ),
        LegalParagraph('Foxir Apps'),
        LegalParagraph('Email: foxirapps@gmail.com'),
        LegalParagraph('© 2025 Foxir Apps. All rights reserved.'),
      ],
    ),
  ],
);
