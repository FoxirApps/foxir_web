import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/foxir/foxir_footer.dart';
import '../components/foxir/foxir_header.dart';
import '../components/foxir/foxir_shader.dart';
import '../constants/theme.dart';

/// Contact page with Web3Forms-backed Name / Email / Message form.
class ContactPage extends StatelessComponent {
  const ContactPage({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'foxir', [
      const FoxirHeader(activeItem: FoxirNavItem.contact),
      section(id: 'top', classes: 'contact', [
        const FoxirShader(
          id: 'foxir-contact-shader',
          classes: 'contact-shader',
          variant: FoxirShaderVariant.ember,
        ),
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
                'Share what you are thinking about. A product, an interface, '
                'or simply the beginning of an idea.',
              ),
            ]),
            div(classes: 'contact-direct', [
              span([.text('Prefer email?')]),
              a(href: 'mailto:$foxirEmail', [
                .text(foxirEmail),
                span(attributes: const {'aria-hidden': 'true'}, [.text('↗')]),
              ]),
            ]),
          ]),
          div(classes: 'contact-form-column', [
            div(classes: 'contact-form-heading', [
              h2([.text('Tell us about it.')]),
              p([
                .text(
                  'Three fields are enough. We will take it from there.',
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
                    label(htmlFor: 'contact-name', [.text('Name')]),
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
                    label(htmlFor: 'contact-email', [.text('Email')]),
                    input(
                      type: .email,
                      name: 'email',
                      id: 'contact-email',
                      attributes: const {
                        'placeholder': 'hello@example.com',
                        'required': '',
                        'autocomplete': 'email',
                      },
                    ),
                  ]),
                  div(classes: 'contact-field', [
                    label(htmlFor: 'contact-message', [.text('Message')]),
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
                      span([.text('Send message')]),
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
                        'We\u2019ll read it soon and get back to you.',
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
    ),
    css('.foxir .contact', [
      css('&').styles(
        position: const Position.relative(),
        minHeight: 760.px,
        overflow: .hidden,
        backgroundColor: foxirBg,
      ),
      css('.contact-shader').styles(
        position: .absolute(
          left: .zero,
          top: .zero,
          right: .zero,
          bottom: .zero,
        ),
        zIndex: const ZIndex(0),
        display: .block,
        width: 100.percent,
        height: 100.percent,
        opacity: 0.86,
        raw: {
          'pointer-events': 'none',
          'transform': 'translateZ(0)',
        },
      ),
      css('&::before').styles(
        position: .absolute(
          left: .zero,
          top: .zero,
          right: .zero,
          bottom: .zero,
        ),
        zIndex: const ZIndex(1),
        raw: {
          'content': '""',
          'pointer-events': 'none',
          'background-image':
              'linear-gradient(180deg, rgba(14,14,14,.22), rgba(14,14,14,.60)), '
              'linear-gradient(90deg, rgba(14,14,14,.18), rgba(14,14,14,.52))',
        },
      ),
      css('.contact-inner').styles(
        position: const Position.relative(),
        zIndex: const ZIndex(2),
        display: .flex,
        width: 100.percent,
        minHeight: 760.px,
        padding: .symmetric(horizontal: 24.px, vertical: 64.px),
        flexDirection: .column,
        justifyContent: .center,
        gap: .all(64.px),
      ),
      css('.contact-intro').styles(
        display: .flex,
        flexDirection: .column,
        alignItems: .start,
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
        raw: {'font-size': 'clamp(3.25rem, 8vw, 7rem)'},
      ),
      css('.contact-title-accent').styles(color: foxirAccent),
      css('.contact-soft').styles(
        maxWidth: 570.px,
        margin: .only(top: 32.px),
        color: foxirMuted,
        fontSize: 1.0625.rem,
        fontWeight: .w300,
        lineHeight: 1.65.em,
      ),
      css('.contact-direct').styles(
        display: .flex,
        margin: .only(top: 48.px),
        flexDirection: .column,
        alignItems: .start,
        gap: .all(10.px),
      ),
      css('.contact-direct > span').styles(
        color: const Color('#8d817e'),
        fontSize: 0.6875.rem,
        fontWeight: .w600,
        letterSpacing: 0.1.em,
        textTransform: .upperCase,
      ),
      css('.contact-direct a', [
        css('&').styles(
          display: .flex,
          alignItems: .center,
          gap: .all(12.px),
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
      css('.contact-form-column').styles(
        display: .flex,
        width: 100.percent,
        maxWidth: 620.px,
        flexDirection: .column,
      ),
      css('.contact-form-heading').styles(
        display: .flex,
        margin: .only(bottom: 24.px),
        flexDirection: .column,
        alignItems: .start,
        gap: .all(8.px),
      ),
      css('.contact-form-heading h2').styles(
        color: foxirInk,
        fontFamily: const .list([
          FontFamily('Hanken Grotesk'),
          FontFamilies.sansSerif,
        ]),
        fontSize: 2.rem,
        fontWeight: .w800,
        letterSpacing: (-0.03).em,
        lineHeight: 1.1.em,
      ),
      css('.contact-form-heading p').styles(
        color: foxirMuted,
        fontSize: 0.9375.rem,
        fontWeight: .w300,
        lineHeight: 1.5.em,
      ),
      css('.contact-status', [
        css('&').styles(
          display: .none,
          margin: .only(bottom: 16.px),
          color: foxirMuted,
          fontSize: 0.75.rem,
          fontWeight: .w600,
          letterSpacing: 0.08.em,
          textTransform: .upperCase,
        ),
        css('&.is-pending, &.is-error').styles(display: .block),
        css('&.is-error').styles(color: const Color('#ff9680')),
      ]),
      css('.contact-panel', [
        css('&').styles(
          position: const Position.relative(),
          padding: .all(24.px),
          border: const Border.all(
            style: .solid,
            color: Color('#ffffff14'),
            width: Unit.pixels(1),
          ),
          backgroundColor: const Color('#101010d9'),
          shadow: const BoxShadow(
            offsetX: Unit.zero,
            offsetY: Unit.pixels(24),
            blur: Unit.pixels(70),
            color: Color('#00000055'),
          ),
          raw: {
            'border-radius': '24px',
            'backdrop-filter': 'blur(22px)',
            '-webkit-backdrop-filter': 'blur(22px)',
          },
        ),
        css('&.is-sent .contact-form').styles(
          raw: {
            'filter': 'blur(6px)',
            'pointer-events': 'none',
            'user-select': 'none',
            'opacity': '0.22',
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
        gap: .all(20.px),
        raw: {'transition': 'filter 240ms ease, opacity 240ms ease'},
      ),
      css('.contact-field', [
        css('&').styles(
          display: .flex,
          width: 100.percent,
          flexDirection: .column,
          gap: .all(9.px),
        ),
        css('label').styles(
          color: const Color('#b2a7a4'),
          fontSize: 0.75.rem,
          fontWeight: .w500,
          letterSpacing: 0.03.em,
        ),
        css('input, textarea').styles(
          width: 100.percent,
          padding: .symmetric(horizontal: 16.px, vertical: 15.px),
          border: const Border.all(
            style: .solid,
            color: Color('#ffffff17'),
            width: Unit.pixels(1),
          ),
          color: foxirInk,
          fontFamily: FontFamily.inherit,
          fontSize: 1.rem,
          fontWeight: .w400,
          backgroundColor: const Color('#ffffff08'),
          raw: {
            'border-radius': '12px',
            'outline': 'none',
            'transition': 'border-color 160ms ease, background-color 160ms ease, box-shadow 160ms ease',
          },
        ),
        css('textarea').styles(
          minHeight: 160.px,
          raw: {'resize': 'vertical'},
        ),
        css('input:focus, textarea:focus').styles(
          border: const Border.all(
            style: .solid,
            color: Color('#ff5722aa'),
            width: Unit.pixels(1),
          ),
          backgroundColor: const Color('#ffffff0d'),
          raw: {'box-shadow': '0 0 0 3px rgba(255,87,34,.10)'},
        ),
        css('input::placeholder, textarea::placeholder').styles(
          color: const Color('#746b69'),
        ),
      ]),
      css('.contact-submit', [
        css('&').styles(
          display: .flex,
          width: 100.percent,
          minHeight: 60.px,
          margin: .only(top: 4.px),
          padding: .symmetric(horizontal: 22.px),
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
            'border': '0',
            'border-radius': '12px',
            'transition': 'background-color 160ms ease, color 160ms ease, transform 160ms ease',
          },
        ),
        css('&:hover, &:focus-visible').styles(
          color: foxirBg,
          backgroundColor: foxirInk,
          raw: {'transform': 'translateY(-1px)'},
        ),
        css('&:disabled').styles(
          cursor: .notAllowed,
          opacity: 0.55,
        ),
      ]),
      css('.contact-success').styles(
        position: const Position.absolute(),
        display: .none,
        raw: {
          'inset': '0',
          'align-items': 'center',
          'justify-content': 'center',
          'padding': '24px',
          'opacity': '0',
          'transition': 'opacity 240ms ease',
          'z-index': '2',
        },
      ),
      css('.contact-success-card').styles(
        display: .flex,
        maxWidth: 420.px,
        flexDirection: .column,
        alignItems: .start,
        gap: .all(16.px),
      ),
      css('.contact-success-eyebrow').styles(
        color: foxirAccent,
        fontSize: 0.75.rem,
        fontWeight: .w700,
        letterSpacing: 0.12.em,
        textTransform: .upperCase,
      ),
      css('.contact-success-card h2').styles(
        color: foxirInk,
        fontFamily: const .list([
          FontFamily('Hanken Grotesk'),
          FontFamilies.sansSerif,
        ]),
        fontSize: 1.75.rem,
        fontWeight: .w800,
        letterSpacing: (-0.03).em,
        lineHeight: 1.1.em,
      ),
      css('.contact-success-card p').styles(
        color: foxirMuted,
        fontSize: 0.9375.rem,
        fontWeight: .w300,
      ),
      css('.contact-success-home', [
        css('&').styles(
          margin: .only(top: 8.px),
          padding: .symmetric(horizontal: 20.px, vertical: 13.px),
          color: Colors.white,
          fontSize: 0.6875.rem,
          fontWeight: .w600,
          letterSpacing: 0.1.em,
          textTransform: .upperCase,
          backgroundColor: foxirAccent,
          raw: {'border-radius': '10px'},
        ),
        css('&:hover, &:focus-visible').styles(
          color: foxirBg,
          backgroundColor: foxirInk,
        ),
      ]),
    ]),
    css.media(desktop, [
      css('.foxir .contact', [
        css('.contact-inner').styles(
          minHeight: 820.px,
          padding: .symmetric(vertical: 88.px),
          flexDirection: .row,
          justifyContent: .spaceBetween,
          alignItems: .center,
          gap: .all(72.px),
          raw: {
            'padding-left': 'clamp(48px, 6vw, 112px)',
            'padding-right': 'clamp(48px, 6vw, 112px)',
          },
        ),
        css('.contact-intro').styles(
          width: 48.percent,
          maxWidth: 760.px,
        ),
        css('.contact-soft').styles(
          fontSize: 1.25.rem,
          lineHeight: 1.6.em,
        ),
        css('.contact-form-column').styles(width: 46.percent),
        css('.contact-panel').styles(padding: .all(32.px)),
      ]),
    ]),
  ];
}
