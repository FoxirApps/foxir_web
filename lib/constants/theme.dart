import 'package:jaspr/dom.dart';

// Shared / Paximus (light) tokens.

/// Primary text color (light surfaces).
const ink = Color('#1d1d1f');

/// Secondary / muted text color (light surfaces).
const muted = Color('#6e6e73');

/// Light gray surface for cards and alternating sections.
const surface = Color('#f5f5f7');

/// Hairline border color (light surfaces).
const hairline = Color('#e8e8ed');

/// Dark background for CTA section and buttons.
const dark = Color('#111113');

/// Muted text on dark backgrounds.
const mutedOnDark = Color('#a1a1a6');

// Foxir Apps (dark) tokens — matched to the Foxir product-studio identity.

/// Page base charcoal.
const foxirBg = Color('#0e0e0e');

/// Brand orange accent.
const foxirAccent = Color('#ff5722');

/// Primary text on dark surfaces.
const foxirInk = Color('#e5e2e1');

/// Secondary text on dark surfaces.
const foxirMuted = Color('#e4beb4');

/// Elevated card / panel surface.
const foxirSurface = Color('#1a1a1a');

/// Slightly brighter elevated surface.
const foxirElevated = Color('#202020');

/// Subtle border on dark surfaces.
const foxirHairline = Color('#2a2a2a');

// Vouxe (dark + lime) tokens — matched to foxirapps.co/vouxe.app.

/// Page base near-black.
const vouxeBg = Color('#0a0a0a');

/// Lime accent from the live Vouxe brand.
const vouxeAccent = Color('#c8f000');

/// Primary text on dark surfaces.
const vouxeInk = Color('#f5f5f7');

/// Secondary text on dark surfaces.
const vouxeMuted = Color('#a8a8ad');

/// Elevated card / panel surface.
const vouxeSurface = Color('#121212');

/// Slightly brighter elevated surface.
const vouxeElevated = Color('#1a1a1a');

/// Subtle border on dark surfaces.
const vouxeHairline = Color('#2a2a2e');

// Better Today (dark + gold) tokens — matched to AppColors.primary.

/// Page base near-black.
const betterBg = Color('#0a0a0a');

/// Gold accent from the Better Today brand.
const betterAccent = Color('#ffd700');

/// Primary text on dark surfaces.
const betterInk = Color('#f5f5f7');

/// Secondary text on dark surfaces.
const betterMuted = Color('#a8a8ad');

/// Elevated card / panel surface.
const betterSurface = Color('#121212');

/// Slightly brighter elevated surface.
const betterElevated = Color('#1a1a1a');

/// Subtle border on dark surfaces.
const betterHairline = Color('#2a2a2e');

/// Max content width of the page.
final contentMaxWidth = 1100.px;

/// Desktop breakpoint used across components.
const desktop = MediaQuery.screen(minWidth: Unit.pixels(768));

// External links — Foxir Apps.
const foxirContactUrl = '/contact';
const foxirEmail = 'foxirapps@gmail.com';
const foxirInstagramUrl = 'https://www.instagram.com/foxirapps/';

/// Public Web3Forms access key (safe for client-side use).
const foxirWeb3FormsAccessKey = 'bbd8179a-cdae-46c4-9404-305bbb697e7f';
const foxirWeb3FormsEndpoint = 'https://api.web3forms.com/submit';

/// Official store badge SVGs (shared across all app landings).
const appStoreBadgeSrc = '/vectors/app_store_badge.svg';
const playStoreBadgeSrc = '/vectors/google_play_badge.svg';

/// Site / app icons (also used as per-route favicons).
const foxirFaviconSrc = '/favicon.png';
const paximusIconSrc = '/images/paximus-icon.png';
const vouxeIconSrc = '/images/optimized/vouxe-icon-96.webp';
const betterTodayIconSrc = '/images/optimized/better-today-icon-96.webp';
const betterTodayHeroSrc = '/images/bt_top.png';
const betterTodayDownloadSrc = '/images/bt_bottom.png';

// External links — Paximus.
const appStoreUrl = 'https://apps.apple.com/us/app/ocd-anxiety-tracker-paximus/id6745874911';
const playStoreUrl = 'https://play.google.com/store/apps/details?id=com.foxir.paximus';
const privacyPolicyUrl = '/paximus/privacy-policy';
const termsOfServiceUrl = '/paximus/terms-of-service';
const tiktokUrl = 'https://www.tiktok.com/@paximus.app';
const instagramUrl = 'https://www.instagram.com/paximus.app/';
const linkedinUrl = 'https://www.linkedin.com/company/foxirapps/';
const twitterUrl = 'https://x.com/foxirapps';
const youtubeUrl = 'https://www.youtube.com/@FoxirApps';

// External links — Vouxe.
const vouxeAppStoreUrl = 'https://apps.apple.com/us/app/vouxe-challenge-tracker/id6756347081';
const vouxePlayStoreUrl = 'https://play.google.com/store/apps/details?id=com.foxir.vouxe';
const vouxePrivacyUrl = '/vouxe/privacy-policy';
const vouxeTermsUrl = '/vouxe/terms-of-service';
const vouxeTiktokUrl = 'https://www.tiktok.com/@vouxe.app';
const vouxeInstagramUrl = 'https://www.instagram.com/vouxe.app';

// External links — Better Today.
const betterAppStoreUrl = 'https://apps.apple.com/us/app/better-today-daily-growth/id6748441674';
const betterPlayStoreUrl = 'https://play.google.com/store/apps/details?id=com.foxir.bettertoday';
const betterPrivacyUrl = '/bettertoday/privacy-policy';
const betterTermsUrl = '/bettertoday/terms-of-service';
const betterTiktokUrl = 'https://www.tiktok.com/@bettertoday.app';
const betterInstagramUrl = 'https://www.instagram.com/bettertoday.app';
