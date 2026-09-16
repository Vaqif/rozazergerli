# Roza Zərgərli — rəsmi sayt

Müğənni, rejissor və aktrisa Roza Zərgərlinin bir səhifəlik rəsmi saytı. Sayt üç dildədir: Azərbaycan, rus və ingilis.

## Fayllar

| Fayl | Nədir |
|---|---|
| `index.html` | Sayt. Dizayn, mətnlər və tərcümələr bu faylın içindədir. |
| `img/` | Saytda göstərilən fotolar: ana ekran, portret və qalereya. |
| `photos/` | Orijinal fotolar. Ehtiyat üçün saxlanılır, sayt bu qovluqdan istifadə etmir. |
| `CNAME` | Domen bağlantısı (`rozazergerli.com`). Silməyin. |
| [YENILEME.md](YENILEME.md) | Konsert, klip, mətn və fotoları dəyişmək üçün addım-addım təlimat. |
| `CLAUDE.md` | Claude Code üçün texniki qeydlər. |

Proqram quraşdırmaq, build etmək və ya verilənlər bazası qurmaq lazım deyil.

## Saytda nə var

- **Haqqında:** bioqrafiya və rəqəmlər.
- **Musiqi:** sinqllar, Spotify və Apple Music pleyerləri.
- **Konsertlər:** turne tarixləri, bilet linkləri və növbəti konsertə geri sayım.
- **Səhnə və teatr:** tamaşalar və karyera xronologiyası.
- **Videolar:** YouTube klipləri saytın içində açılır.
- **Qalereya:** foto böyüdülərək baxılır.
- **Xəbərlər** və **brendlərlə əməkdaşlıq** (media-kit).
- **Əlaqə:** telefonlar, sosial şəbəkələr və sorğu forması.
- Açıq və tünd tema. Ziyarətçinin seçdiyi tema və dil yadda saxlanılır.

## Kompüterdə baxmaq

`index.html` faylını iki dəfə klikləyib brauzerdə açın.

YouTube pleyeri, Spotify və Apple Music pleyerləri bəzən fayl birbaşa açılanda işləmir. Onları yoxlamaq üçün qovluqda terminal açıb bunu işə salın:

```bash
python3 -m http.server 8000
```

Sonra brauzerdə `http://localhost:8000` ünvanını açın.

## Yerləşdirmə

Sayt **GitHub Pages** üzərindən **https://rozazergerli.com** ünvanında yayımlanır:

- **Kod:** [github.com/Vaqif/rozazergerli](https://github.com/Vaqif/rozazergerli), `main` branch.
- **Domen DNS-i:** Cloudflare.
- **Dəyişikliyi saytda göstərmək:** `git push`. Dəyişiklik 1–2 dəqiqəyə saytda görünür.
- **`CNAME` faylını silməyin,** domen bağlantısı ondadır.

Başqa hostinqə (cPanel, Netlify, Vercel) köçmək lazım olsa, `index.html` faylını və `img/` qovluğunu birlikdə yükləyin.

## Vacib qeydlər

- **Əlaqə forması sorğuları heç yerə göndərmir.** Forma yalnız xanaların doldurulduğunu yoxlayır və "Sorğunuz qəbul olundu" yazısını göstərir. Sorğuların e-poçta gəlməsi üçün forma servisi (məsələn, Formspree) qoşulmalıdır.
- **Fotoları `index.html`-in içinə yerləşdirməyin.** Əvvəl fotolar faylın içində idi: fayl 2 MB idi və sayt 20 saniyəyə qədər boş görünürdü. Fotolar `img/` qovluğunda qalmalıdır (bax: [YENILEME.md](YENILEME.md#fotolar)).
- Konsert tarixləri keçdikcə geri sayım avtomatik olaraq növbəti konsertə keçir. Bütün tarixlər keçəndə "Turne başa çatdı — yeni tarixlər tezliklə" yazısı çıxır.
