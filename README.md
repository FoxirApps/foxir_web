# foxir_web

A new Jaspr project

## Running the project

Run your project using `jaspr serve`.

The development server will be available on `http://localhost:8080`.

## Building the project

Build your project using `jaspr build`.

The output will be located inside the `build/jaspr/` directory.

## Optimizing images

Install the WebP tools once:

```sh
brew install webp
```

Generate the responsive WebP variants used by the landing pages:

```sh
./tool/optimize_images.sh
```

Source PNG files remain in `web/images/` as browser fallbacks. Generated
variants are written to `web/images/optimized/`. When adding a new raster
asset, add its target widths to `tool/optimize_images.sh` and reference the
variants through `ResponsiveImage`.
