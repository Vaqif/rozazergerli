#!/bin/bash
# Saytın fotosunu hazırlayır: ölçünü kiçildir və WebP formatına çevirir.
#
# İstifadə:
#   tools/foto.sh yeni-foto.jpg hero          # ana ekran
#   tools/foto.sh yeni-foto.jpg portrait      # Haqqında bölməsi
#   tools/foto.sh yeni-foto.jpg gallery-05    # qalereya, 5-ci foto
#
# Tələb: cwebp (macOS: brew install webp)
set -euo pipefail

if [ $# -ne 2 ]; then
  sed -n '4,8p' "$0" | sed 's/^# \{0,1\}//'
  exit 1
fi

src="$1"; name="$2"
root="$(cd "$(dirname "$0")/.." && pwd)"
img="$root/img"

command -v cwebp >/dev/null || { echo "cwebp tapılmadı. Quraşdırın: brew install webp"; exit 1; }
[ -f "$src" ] || { echo "Fayl tapılmadı: $src"; exit 1; }

width=$(sips -g pixelWidth "$src" | awk '/pixelWidth/{print $2}')

# make <çıxış> <maksimum en>: fotonu böyütmədən kiçildir
make() {
  local out="$1" max="$2" resize=()
  [ "$width" -gt "$max" ] && resize=(-resize "$max" 0)
  cwebp -quiet -q 78 -m 6 -metadata none ${resize[@]+"${resize[@]}"} "$src" -o "$out"
  echo "Hazırdır: ${out#$root/} ($(( $(stat -f%z "$out") / 1024 )) KB)"
}

case "$name" in
  hero)          make "$img/hero.webp" 900 ;;
  portrait)      make "$img/portrait.webp" 800 ;;
  gallery-[0-9][0-9])
                 make "$img/$name.webp" 600          # qalereyadakı kiçik şəkil
                 make "$img/$name-large.webp" 1200 ;; # böyüdüləndə açılan şəkil
  *) echo "Ad səhvdir: $name (hero, portrait və ya gallery-01 … gallery-99)"; exit 1 ;;
esac

# Orijinalı saxla ki, sonra yenidən çevirmək mümkün olsun
mkdir -p "$img/src"
[ "$(cd "$(dirname "$src")" && pwd)/$(basename "$src")" = "$img/src/$name.jpg" ] || cp "$src" "$img/src/$name.jpg"
