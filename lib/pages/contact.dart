import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/foxir/foxir_footer.dart';
import '../components/foxir/foxir_header.dart';
import '../constants/theme.dart';

/// Contact page with Web3Forms-backed Name / Email / Message form.
class ContactPage extends StatelessComponent {
  const ContactPage({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'foxir', [
      const FoxirHeader(contactActive: true),
      section(id: 'top', classes: 'contact', [
        div(classes: 'contact-inner', [
          div(classes: 'contact-intro', [
            h1([
              span([.text('Have an idea?')]),
              span(classes: 'contact-title-accent', [
                .text("Let's make it real."),
              ]),
            ]),
            p(classes: 'contact-soft', [
              .text(
                'We build our own products from zero to one. If there is an '
                'idea you want to explore with us, tell us where it starts.',
              ),
            ]),
            div(classes: 'contact-meta', [
              div(classes: 'contact-meta-group', [
                span(classes: 'contact-meta-label', [.text('Direct')]),
                a(href: 'mailto:$foxirEmail', [.text(foxirEmail)]),
              ]),
              div(classes: 'contact-meta-group', [
                span(classes: 'contact-meta-label', [.text('Explore')]),
                div(classes: 'contact-app-links', [
                  a(href: '/paximus', [.text('Paximus')]),
                  a(href: '/vouxe', [.text('Vouxe')]),
                  a(href: '/bettertoday', [.text('Better Today')]),
                ]),
              ]),
            ]),
          ]),
          div(classes: 'contact-form-column', [
            div(classes: 'contact-form-heading', [
              span([.text('Project inquiry')]),
              p([
                .text(
                  'Three simple fields. Share the idea and we will take it from there.',
                ),
              ]),
            ]),
            p(id: 'contact-status', classes: 'contact-status', []),
            div(id: 'contact-panel', classes: 'contact-panel', [
              form(
                id: 'contact-form',
                classes: 'contact-form',
                action: foxirWeb3FormsEndpoint,
                method: .post,
                [
                  input(
                    type: .hidden,
                    name: 'access_key',
                    value: foxirWeb3FormsAccessKey,
                  ),
                  input(
                    type: .hidden,
                    name: 'subject',
                    value: 'New message from Foxir Apps contact',
                  ),
                  input(
                    type: .checkbox,
                    name: 'botcheck',
                    attributes: const {
                      'style': 'display:none',
                      'tabindex': '-1',
                      'autocomplete': 'off',
                    },
                  ),
                  div(classes: 'contact-field', [
                    label(htmlFor: 'contact-name', [.text('01 / Name*')]),
                    input(
                      type: .text,
                      name: 'name',
                      id: 'contact-name',
                      attributes: const {
                        'placeholder': 'Jane Smith',
                        'required': '',
                        'autocomplete': 'name',
                      },
                    ),
                  ]),
                  div(classes: 'contact-field', [
                    label(htmlFor: 'contact-email', [.text('02 / Email*')]),
                    input(
                      type: .email,
                      name: 'email',
                      id: 'contact-email',
                      attributes: const {
                        'placeholder': 'example@foxirapps.co',
                        'required': '',
                        'autocomplete': 'email',
                      },
                    ),
                  ]),
                  div(classes: 'contact-field', [
                    label(htmlFor: 'contact-message', [
                      .text('03 / Message*'),
                    ]),
                    textarea(
                      name: 'message',
                      id: 'contact-message',
                      rows: 5,
                      required: true,
                      placeholder: 'Tell us about the idea...',
                      [],
                    ),
                  ]),
                  button(
                    type: .submit,
                    id: 'contact-submit',
                    classes: 'contact-submit',
                    [
                      span([.text('Send inquiry')]),
                      span(
                        attributes: const {'aria-hidden': 'true'},
                        [
                          .text('↗'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              div(
                id: 'contact-success',
                classes: 'contact-success',
                attributes: const {'aria-hidden': 'true'},
                [
                  div(classes: 'contact-success-card', [
                    span(classes: 'contact-success-eyebrow', [.text('Sent')]),
                    h2([.text('Thanks — we got your message.')]),
                    p([
                      .text(
                        'We\u2019ll read it soon and get back to you. '
                        'In the meantime, explore the apps we craft.',
                      ),
                    ]),
                    a(classes: 'contact-success-home', href: '/', [
                      .text('Back to home'),
                    ]),
                  ]),
                ],
              ),
            ]),
          ]),
        ]),
      ]),
      const FoxirFooter(),
      script(content: _submitScript),
    ]);
  }

  /// Submits via fetch; on success shows a blurred overlay with a clear CTA.
  static const _submitScript = '''
(function () {
  var form = document.getElementById('contact-form');
  var status = document.getElementById('contact-status');
  var submit = document.getElementById('contact-submit');
  var panel = document.getElementById('contact-panel');
  var success = document.getElementById('contact-success');
  if (!form || !status || !submit || !panel || !success) return;

  form.addEventListener('submit', function (event) {
    event.preventDefault();
    status.textContent = 'Sending...';
    status.className = 'contact-status is-pending';
    submit.disabled = true;

    fetch(form.action, {
      method: 'POST',
      body: new FormData(form),
      headers: { 'Accept': 'application/json' }
    })
      .then(function (response) { return response.json(); })
      .then(function (data) {
        if (data.success) {
          status.textContent = '';
          status.className = 'contact-status';
          form.reset();
          panel.classList.add('is-sent');
          success.setAttribute('aria-hidden', 'false');
          success.querySelector('.contact-success-home').focus();
        } else {
          status.textContent = data.message || 'Something went wrong. Please try again.';
          status.className = 'contact-status is-error';
        }
      })
      .catch(function () {
        status.textContent = 'Something went wrong. Please try again.';
        status.className = 'contact-status is-error';
      })
      .finally(function () {
        submit.disabled = false;
      });
  });
})();
''';

  @css
  static List<StyleRule> get styles => [
    css('.foxir').styles(
      minHeight: 100.vh,
      color: foxirInk,
      backgroundColor: foxirBg,
      fontFamily: const .list([
        FontFamily('Geist'),
        FontFamilies.sansSerif,
      ]),
      raw: {
        'background-image':
            'radial-gradient(ellipse 90% 55% at 15% -5%, rgba(255, 87, 34, 0.32), transparent 55%), '
            'radial-gradient(ellipse 70% 45% at 95% 15%, rgba(255, 87, 34, 0.14), transparent 50%), '
            'radial-gradient(ellipse 60% 50% at 50% 110%, rgba(255, 87, 34, 0.10), transparent 55%), '
            'linear-gradient(180deg, #121212 0%, #0e0e0e 45%, #0a0a0a 100%)',
        'background-attachment': 'fixed',
      },
    ),
    css('.foxir .contact', [
      css('&').styles(backgroundColor: foxirBg),
      css('.contact-inner').styles(
        display: .flex,
        width: 100.percent,
        minHeight: 760.px,
        border: const Border.only(
          left: BorderSide(
            style: .solid,
            color: Color('#2a2a2a80'),
            width: Unit.pixels(2),
          ),
          right: BorderSide(
            style: .solid,
            color: Color('#2a2a2a80'),
            width: Unit.pixels(2),
          ),
          bottom: BorderSide(
            style: .solid,
            color: Color('#2a2a2a80'),
            width: Unit.pixels(2),
          ),
        ),
        flexDirection: .column,
      ),
      css('.contact-intro').styles(
        position: const Position.relative(),
        display: .flex,
        padding: .symmetric(horizontal: 24.px, vertical: 64.px),
        flex: const Flex.grow(1),
        flexDirection: .column,
        justifyContent: .center,
        overflow: .hidden,
        raw: {
          'background-image':
              'radial-gradient(circle at 12% 12%, rgba(255,87,34,.16), transparent 38%), '
              'linear-gradient(rgba(255,255,255,.018) 1px, transparent 1px), '
              'linear-gradient(90deg, rgba(255,255,255,.018) 1px, transparent 1px)',
          'background-size': 'auto, 48px 48px, 48px 48px',
        },
      ),
      css('h1').styles(
        display: .flex,
        flexDirection: .column,
        color: foxirInk,
        fontFamily: const .list([
          FontFamily('Hanken Grotesk'),
          FontFamilies.sansSerif,
        ]),
        fontWeight: .w900,
        letterSpacing: (-0.05).em,
        lineHeight: 0.92.em,
        textTransform: .upperCase,
        raw: {'font-size': 'clamp(3.5rem, 7vw, 7rem)'},
      ),
      css('.contact-title-accent').styles(color: foxirAccent),
      css('.contact-soft').styles(
        maxWidth: 600.px,
        margin: .only(top: 36.px),
        color: foxirMuted,
        fontSize: 1.0625.rem,
        fontWeight: .w300,
        lineHeight: 1.65.em,
      ),
      css('.contact-meta').styles(
        display: .grid,
        margin: .only(top: 56.px),
        padding: .only(top: 32.px),
        border: const Border.only(
          top: BorderSide(
            style: .solid,
            color: Color('#2a2a2a80'),
            width: Unit.pixels(2),
          ),
        ),
        gap: .all(32.px),
        gridTemplate: const GridTemplate(
          columns: GridTracks([
            GridTrack(TrackSize.fr(1)),
            GridTrack(TrackSize.fr(1)),
          ]),
        ),
      ),
      css('.contact-meta-group').styles(
        display: .flex,
        minWidth: .zero,
        flexDirection: .column,
        alignItems: .start,
        gap: .all(12.px),
      ),
      css('.contact-meta-label').styles(
        color: foxirAccent,
        fontSize: 0.6875.rem,
        fontWeight: .w600,
        letterSpacing: 0.1.em,
        textTransform: .upperCase,
      ),
      css('.contact-meta-group a', [
        css('&').styles(
          color: foxirInk,
          fontFamily: const .list([
            FontFamily('Hanken Grotesk'),
            FontFamilies.sansSerif,
          ]),
          fontSize: 1.125.rem,
          fontWeight: .w600,
          raw: {
            'overflow-wrap': 'anywhere',
            'transition': 'color 160ms ease',
          },
        ),
        css('&:hover, &:focus-visible').styles(color: foxirAccent),
      ]),
      css('.contact-app-links').styles(
        display: .flex,
        flexWrap: .wrap,
        gap: .all(8.px),
      ),
      css('.contact-app-links a:not(:last-child)::after').styles(
        margin: .only(left: 8.px),
        color: const Color('#6f625f'),
        raw: {'content': '"/"'},
      ),
      css('.contact-form-column').styles(
        display: .flex,
        padding: .symmetric(horizontal: 24.px, vertical: 56.px),
        border: const Border.only(
          top: BorderSide(
            style: .solid,
            color: foxirHairline,
            width: Unit.pixels(2),
          ),
        ),
        flex: const Flex.grow(1),
        flexDirection: .column,
        justifyContent: .center,
        backgroundColor: const Color('#111111'),
      ),
      css('.contact-form-heading').styles(
        display: .flex,
        margin: .only(bottom: 28.px),
        justifyContent: .spaceBetween,
        alignItems: .end,
        gap: .all(24.px),
      ),
      css('.contact-form-heading > span').styles(
        color: foxirAccent,
        fontSize: 0.6875.rem,
        fontWeight: .w600,
        letterSpacing: 0.1.em,
        textTransform: .upperCase,
      ),
      css('.contact-form-heading p').styles(
        maxWidth: 340.px,
        color: foxirMuted,
        fontSize: 0.875.rem,
        fontWeight: .w300,
        lineHeight: 1.5.em,
        textAlign: .end,
      ),
      css('.contact-status', [
        css('&').styles(
          display: .none,
          margin: .only(bottom: 16.px),
          padding: .symmetric(horizontal: 18.px, vertical: 14.px),
          border: const Border.all(
            style: .solid,
            color: foxirHairline,
            width: Unit.pixels(2),
          ),
          fontSize: 0.75.rem,
          fontWeight: .w600,
          letterSpacing: 0.08.em,
          textTransform: .upperCase,
        ),
        css('&.is-pending, &.is-error').styles(display: .block),
        css('&.is-pending').styles(
          color: foxirMuted,
          backgroundColor: foxirSurface,
        ),
        css('&.is-error').styles(
          color: foxirInk,
          backgroundColor: const Color('#3d1814'),
        ),
      ]),
      css('.contact-panel', [
        css('&').styles(
          position: const Position.relative(),
          padding: .all(24.px),
          border: const Border.all(
            style: .solid,
            color: foxirHairline,
            width: Unit.pixels(2),
          ),
          backgroundColor: foxirBg,
        ),
        css('&.is-sent .contact-form').styles(
          raw: {
            'filter': 'blur(6px)',
            'pointer-events': 'none',
            'user-select': 'none',
            'opacity': '0.28',
          },
        ),
        css('&.is-sent .contact-success').styles(
          display: .flex,
          raw: {'opacity': '1'},
        ),
      ]),
      css('.contact-form').styles(
        display: .flex,
        flexDirection: .column,
        gap: .all(24.px),
        raw: {'transition': 'filter 240ms ease, opacity 240ms ease'},
      ),
      css('.contact-field', [
        css('&').styles(
          display: .flex,
          width: 100.percent,
          flexDirection: .column,
          gap: .all(10.px),
        ),
        css('label').styles(
          color: foxirAccent,
          fontSize: 0.6875.rem,
          fontWeight: .w600,
          letterSpacing: 0.1.em,
          textTransform: .upperCase,
        ),
        css('input, textarea').styles(
          width: 100.percent,
          padding: .symmetric(horizontal: 18.px, vertical: 16.px),
          border: const Border.all(
            style: .solid,
            color: foxirHairline,
            width: Unit.pixels(2),
          ),
          color: foxirInk,
          fontFamily: FontFamily.inherit,
          fontSize: 1.rem,
          fontWeight: .w400,
          backgroundColor: foxirSurface,
          raw: {
            'outline': 'none',
            'transition': 'border-color 160ms ease, background-color 160ms ease, box-shadow 160ms ease',
          },
        ),
        css('textarea').styles(
          minHeight: 190.px,
          raw: {'resize': 'vertical'},
        ),
        css('input:focus, textarea:focus').styles(
          border: const Border.all(
            style: .solid,
            color: foxirAccent,
            width: Unit.pixels(2),
          ),
          backgroundColor: foxirElevated,
          raw: {'box-shadow': '0 0 0 3px rgba(255,87,34,.12)'},
        ),
        css('input::placeholder, textarea::placeholder').styles(
          color: const Color('#766864'),
        ),
      ]),
      css('.contact-submit', [
        css('&').styles(
          display: .flex,
          width: 100.percent,
          minHeight: 64.px,
          padding: .symmetric(horizontal: 24.px),
          border: const Border.all(
            style: .solid,
            color: foxirAccent,
            width: Unit.pixels(2),
          ),
          justifyContent: .spaceBetween,
          alignItems: .center,
          color: Colors.white,
          cursor: .pointer,
          fontFamily: FontFamily.inherit,
          fontSize: 0.75.rem,
          fontWeight: .w600,
          letterSpacing: 0.1.em,
          textTransform: .upperCase,
          backgroundColor: foxirAccent,
          raw: {
            'transition': 'background-color 160ms ease, color 160ms ease, border-color 160ms ease',
          },
        ),
        css('&:hover, &:focus-visible').styles(
          border: const Border.all(
            style: .solid,
            color: foxirInk,
            width: Unit.pixels(2),
          ),
          color: foxirBg,
          backgroundColor: foxirInk,
        ),
        css('&:disabled').styles(
          cursor: .notAllowed,
          opacity: 0.55,
        ),
      ]),
      css('.contact-success', [
        css('&').styles(
          position: const Position.absolute(),
          display: .none,
          raw: {
            'inset': '0',
            'align-items': 'center',
            'justify-content': 'center',
            'padding': '20px',
            'opacity': '0',
            'transition': 'opacity 240ms ease',
            'z-index': '2',
          },
        ),
      ]),
      css('.contact-success-card', [
        css('&').styles(
          display: .flex,
          maxWidth: 420.px,
          padding: .all(32.px),
          border: const Border.all(
            style: .solid,
            color: foxirAccent,
            width: Unit.pixels(2),
          ),
          flexDirection: .column,
          alignItems: .start,
          gap: .all(16.px),
          textAlign: .start,
          backgroundColor: const Color('#0e0e0ef2'),
          shadow: const BoxShadow(
            offsetX: Unit.zero,
            offsetY: Unit.pixels(18),
            blur: Unit.pixels(40),
            color: Color('#00000088'),
          ),
          raw: {
            'backdrop-filter': 'blur(18px)',
            '-webkit-backdrop-filter': 'blur(18px)',
          },
        ),
        css('.contact-success-eyebrow').styles(
          color: foxirAccent,
          fontSize: 0.8125.rem,
          fontWeight: .w700,
          letterSpacing: 0.12.em,
          textTransform: .upperCase,
        ),
        css('h2').styles(
          color: foxirInk,
          fontFamily: const .list([
            FontFamily('Hanken Grotesk'),
            FontFamilies.sansSerif,
          ]),
          fontSize: 1.75.rem,
          fontWeight: .w800,
          letterSpacing: (-0.03).em,
          lineHeight: 1.1.em,
          textTransform: .upperCase,
        ),
        css('p').styles(
          color: foxirMuted,
          fontSize: 0.9375.rem,
          fontWeight: .w300,
        ),
      ]),
      css('.contact-success-home', [
        css('&').styles(
          margin: .only(top: 8.px),
          padding: .symmetric(horizontal: 22.px, vertical: 14.px),
          border: const Border.all(
            style: .solid,
            color: foxirAccent,
            width: Unit.pixels(2),
          ),
          color: Colors.white,
          fontSize: 0.6875.rem,
          fontWeight: .w600,
          letterSpacing: 0.1.em,
          textTransform: .upperCase,
          backgroundColor: foxirAccent,
        ),
        css('&:hover, &:focus-visible').styles(
          color: foxirBg,
          backgroundColor: foxirInk,
        ),
      ]),
    ]),
    css.media(desktop, [
      css('.foxir .contact', [
        css('.contact-inner').styles(flexDirection: .row),
        css('.contact-intro').styles(
          width: 50.percent,
          minHeight: 820.px,
          padding: .symmetric(vertical: 96.px),
          raw: {
            'padding-left': 'clamp(48px, 6vw, 112px)',
            'padding-right': 'clamp(48px, 6vw, 112px)',
          },
        ),
        css('.contact-soft').styles(
          fontSize: 1.25.rem,
          lineHeight: 1.6.em,
        ),
        css('.contact-form-column').styles(
          width: 50.percent,
          minHeight: 820.px,
          padding: .symmetric(vertical: 96.px),
          border: const Border.only(
            left: BorderSide(
              style: .solid,
              color: foxirHairline,
              width: Unit.pixels(2),
            ),
          ),
          raw: {
            'padding-left': 'clamp(48px, 6vw, 112px)',
            'padding-right': 'clamp(48px, 6vw, 112px)',
          },
        ),
        css('.contact-panel').styles(padding: .all(36.px)),
      ]),
    ]),
  ];
}
