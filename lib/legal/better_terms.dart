import 'legal_document.dart';

const betterTerms = LegalDocument(
  title: 'Terms of Service for Better Today Mobile App',
  lastUpdated: 'January 2025',
  sections: [
    LegalSection(
      heading: 'Agreement',
      blocks: [
        LegalParagraph(
          'These Terms of Service (“Terms”) govern your use of the Better Today mobile '
          'application (“App”) and the website at https://foxirapps.co/bettertoday '
          '(“Website”) provided by Foxir Apps (“we,” “us,” or “our”). By accessing or '
          'using the App or Website, you (“User” or “you”) agree to be bound by these '
          'Terms. If you do not agree to these Terms, you must not use the App or Website.',
        ),
      ],
    ),
    LegalSection(
      heading: 'Use of the App',
      blocks: [
        LegalTerm(
          'Eligibility',
          'You must be at least 18 years old to use the App, or between 13 and 17 years '
          'old with parental or guardian consent. If you access the App on behalf of an '
          'entity, you represent that you have the authority to bind that entity to these Terms.',
        ),
        LegalTerm(
          'Account Registration',
          'Some App features require you to create an account. You must provide accurate '
          'and complete information, keep your account credentials confidential, and notify '
          'us immediately of any unauthorized use by emailing foxirapps@gmail.com.',
        ),
        LegalTerm(
          'Acceptable Use',
          'You agree not to: (a) violate any applicable laws; (b) reverse-engineer, '
          'decompile, or copy the App; (c) interfere with the App’s servers or networks; '
          '(d) upload malicious code; or (e) harass, intimidate, or harm others through '
          'your use of the App.',
        ),
      ],
    ),
    LegalSection(
      heading: 'Intellectual Property',
      blocks: [
        LegalTerm(
          'Ownership',
          'The App, Website, and all related content are owned by Foxir Apps or its '
          'licensors and are protected by intellectual property laws.',
        ),
        LegalTerm(
          'Limited License',
          'We grant you a personal, non-exclusive, non-transferable, and revocable '
          'license to use the App for non-commercial purposes, subject to these Terms.',
        ),
      ],
    ),
    LegalSection(
      heading: 'Privacy',
      blocks: [
        LegalParagraph(
          'Your use of the App is also governed by the Better Today Privacy Policy, which '
          'is incorporated into these Terms by reference.',
        ),
      ],
    ),
    LegalSection(
      heading: 'In-App Purchases & Subscriptions',
      blocks: [
        LegalTerm(
          'Subscription Options',
          'The App offers monthly, yearly, and lifetime subscription plans to unlock '
          'premium features that support your daily improvement journey.',
        ),
        LegalTerm(
          'Free Trials',
          'If you do not cancel a free trial at least 24 hours before it ends, it will '
          'automatically convert to a paid subscription.',
        ),
        LegalTerm(
          'Billing & Renewal',
          'Payments are charged to your Apple or Google account upon confirmation of '
          'purchase. Subscriptions renew automatically unless canceled through your store '
          'settings before the current period ends.',
        ),
        LegalTerm(
          'Price Changes',
          'We will notify you of any price increases and, where required by law, seek '
          'your consent.',
        ),
        LegalTerm(
          'Refunds',
          'All sales are final. Refund requests must be submitted through Apple or Google, '
          'subject to their respective policies.',
        ),
      ],
    ),
    LegalSection(
      heading: 'Disclaimers & Limitations',
      blocks: [
        LegalTerm(
          'Availability',
          'The App is provided “as is” and “as available” without guarantees of '
          'uninterrupted service.',
        ),
        LegalTerm(
          'Third-Party Services',
          'The App integrates third-party services such as Firebase, RevenueCat, and '
          'OneSignal. We are not responsible for their content or policies.',
        ),
        LegalTerm(
          'Disclaimer of Warranties',
          'To the maximum extent permitted by law, we disclaim all implied warranties, '
          'including merchantability, fitness for a particular purpose, and non-infringement.',
        ),
        LegalTerm(
          'Limitation of Liability',
          'Foxir Apps shall not be liable for indirect, incidental, consequential, '
          'special, or punitive damages. Our total liability to you will not exceed the '
          'amount you paid to us in the past twelve months.',
        ),
      ],
    ),
    LegalSection(
      heading: 'Indemnification',
      blocks: [
        LegalParagraph(
          'You agree to indemnify and hold harmless Foxir Apps, its directors, officers, '
          'employees, and agents from any claims, losses, or expenses arising from your '
          'misuse of the App or violation of these Terms.',
        ),
      ],
    ),
    LegalSection(
      heading: 'Termination',
      blocks: [
        LegalParagraph(
          'We may suspend or terminate your access to the App or Website at any time, '
          'without notice, if you breach these Terms or if we discontinue the App.',
        ),
      ],
    ),
    LegalSection(
      heading: 'Changes to These Terms',
      blocks: [
        LegalParagraph(
          'We may update these Terms periodically. Material changes will be communicated '
          'via an in-App notice or email. Your continued use of the App or Website after '
          'the “Last updated” date constitutes acceptance of the revised Terms.',
        ),
      ],
    ),
    LegalSection(
      heading: 'Miscellaneous',
      blocks: [
        LegalParagraph(
          'If any provision of these Terms is found unenforceable, the remaining '
          'provisions will remain in effect. These Terms represent the entire agreement '
          'between you and Foxir Apps regarding your use of Better Today.',
        ),
      ],
    ),
    LegalSection(
      heading: 'Contact Us',
      blocks: [
        LegalParagraph(
          'For questions or concerns about these Terms, please contact us at:',
        ),
        LegalParagraph('Email: foxirapps@gmail.com'),
        LegalParagraph('© 2025 Foxir Apps. All rights reserved.'),
      ],
    ),
  ],
);
