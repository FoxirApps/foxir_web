#!/usr/bin/env bash

set -euo pipefail

project_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source_dir="$project_root/web/images"
output_dir="$source_dir/optimized"

if ! command -v cwebp >/dev/null 2>&1; then
  echo "cwebp is required. Install it with: brew install webp" >&2
  exit 1
fi

mkdir -p "$output_dir"

encode() {
  local source_name="$1"
  local output_name="$2"
  local width="$3"

  cwebp \
    -quiet \
    -q 84 \
    -alpha_q 100 \
    -m 6 \
    -metadata none \
    -resize "$width" 0 \
    "$source_dir/$source_name" \
    -o "$output_dir/$output_name"
}

encode_lossless() {
  local source_name="$1"
  local output_name="$2"
  local width="$3"

  cwebp \
    -quiet \
    -lossless \
    -m 6 \
    -metadata none \
    -resize "$width" 0 \
    "$source_dir/$source_name" \
    -o "$output_dir/$output_name"
}

# Better Today
encode bt_top.png bt-top-720.webp 720
encode bt_top.png bt-top-1360.webp 1360
encode bt_bottom.png bt-bottom-640.webp 640
encode bt_bottom.png bt-bottom-1280.webp 1280
encode_lossless bt_logo_transparent.png better-today-icon-96.webp 96

# Paximus
encode land_1.png paximus-hero-a-320.webp 320
encode land_1.png paximus-hero-a-640.webp 640
encode land_2.png paximus-hero-b-320.webp 320
encode land_2.png paximus-hero-b-640.webp 640
encode feat1.png paximus-feature-snap-640.webp 640
encode feat1.png paximus-feature-snap-1280.webp 1280
encode paximus-feature-calm-routines.png paximus-feature-routines-640.webp 640
encode paximus-feature-calm-routines.png paximus-feature-routines-1280.webp 1280
encode paximus-feature-history.png paximus-feature-history-640.webp 640
encode paximus-feature-history.png paximus-feature-history-1280.webp 1280
encode feat_mood.png paximus-feature-mood-640.webp 640
encode feat_mood.png paximus-feature-mood-1280.webp 1280
encode paximus-feature-notes.png paximus-feature-notes-640.webp 640
encode paximus-feature-notes.png paximus-feature-notes-1280.webp 1280
encode paximus-feature-meditation.png paximus-feature-meditation-640.webp 640
encode paximus-feature-meditation.png paximus-feature-meditation-1280.webp 1280

# Vouxe
encode vouxe-phones.png vouxe-hero-720.webp 720
encode vouxe-phones.png vouxe-hero-1280.webp 1280
encode vp1.png vouxe-feature-1-256.webp 256
encode vp1.png vouxe-feature-1-512.webp 512
encode vp2.png vouxe-feature-2-256.webp 256
encode vp2.png vouxe-feature-2-512.webp 512
encode vp3.png vouxe-feature-3-256.webp 256
encode vp3.png vouxe-feature-3-512.webp 512
encode vp4.png vouxe-feature-4-256.webp 256
encode vp4.png vouxe-feature-4-512.webp 512
encode_lossless vouxe-icon.png vouxe-icon-96.webp 96

echo "Optimized images written to $output_dir"
