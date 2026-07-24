// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/server.dart';
import 'package:foxir_web/components/foxir/foxir_about.dart' as _foxir_about;
import 'package:foxir_web/components/foxir/foxir_apps.dart' as _foxir_apps;
import 'package:foxir_web/components/foxir/foxir_cta.dart' as _foxir_cta;
import 'package:foxir_web/components/foxir/foxir_footer.dart' as _foxir_footer;
import 'package:foxir_web/components/foxir/foxir_header.dart' as _foxir_header;
import 'package:foxir_web/components/foxir/foxir_hero.dart' as _foxir_hero;
import 'package:foxir_web/components/paximus/cta.dart' as _cta;
import 'package:foxir_web/components/paximus/features.dart' as _features;
import 'package:foxir_web/components/paximus/footer.dart' as _footer;
import 'package:foxir_web/components/paximus/header.dart' as _header;
import 'package:foxir_web/components/paximus/hero.dart' as _hero;
import 'package:foxir_web/components/paximus/reviews.dart' as _reviews;
import 'package:foxir_web/components/paximus/store_buttons.dart'
    as _store_buttons;
import 'package:foxir_web/components/vouxe/cta.dart' as _vouxe_cta;
import 'package:foxir_web/components/vouxe/features.dart' as _vouxe_features;
import 'package:foxir_web/components/vouxe/footer.dart' as _vouxe_footer;
import 'package:foxir_web/components/vouxe/header.dart' as _vouxe_header;
import 'package:foxir_web/components/vouxe/hero.dart' as _vouxe_hero;
import 'package:foxir_web/components/vouxe/store_buttons.dart'
    as _vouxe_store_buttons;
import 'package:foxir_web/components/vouxe/testimonials.dart' as _testimonials;
import 'package:foxir_web/pages/home.dart' as _home;
import 'package:foxir_web/pages/paximus.dart' as _paximus;
import 'package:foxir_web/pages/vouxe.dart' as _vouxe;

/// Default [ServerOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.server.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultServerOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ServerOptions get defaultServerOptions => ServerOptions(
  styles: () => [
    ..._foxir_about.FoxirAbout.styles,
    ..._foxir_apps.FoxirApps.styles,
    ..._foxir_cta.FoxirCta.styles,
    ..._foxir_footer.FoxirFooter.styles,
    ..._foxir_header.FoxirHeader.styles,
    ..._foxir_hero.FoxirHero.styles,
    ..._cta.Cta.styles,
    ..._features.Features.styles,
    ..._footer.Footer.styles,
    ..._header.Header.styles,
    ..._hero.Hero.styles,
    ..._reviews.Reviews.styles,
    ..._store_buttons.StoreButtons.styles,
    ..._vouxe_cta.Cta.styles,
    ..._vouxe_features.Features.styles,
    ..._vouxe_footer.Footer.styles,
    ..._vouxe_header.Header.styles,
    ..._vouxe_hero.Hero.styles,
    ..._vouxe_store_buttons.StoreButtons.styles,
    ..._testimonials.Testimonials.styles,
    ..._home.HomePage.styles,
    ..._paximus.PaximusPage.styles,
    ..._vouxe.VouxePage.styles,
  ],
);
