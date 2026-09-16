# Roza Zərgərli — rəsmi sayt

Müğənni, rejissor və aktrisa Roza Zərgərlinin bir səhifəlik rəsmi saytı. Sayt üç dildədir: Azərbaycan, rus və ingilis.

## Fayllar

| Fayl | Nədir |
|---|---|
| `index.html` | Bütün sayt. Dizayn, mətnlər, tərcümələr və fotolar bu faylın içindədir. |
| `photos/` | Orijinal fotolar. Ehtiyat üçün saxlanılır, sayt bu qovluqdan istifadə etmir. |
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

## Hostinqə yerləşdirmək

`index.html` faylını istənilən hostinqə yükləmək kifayətdir: cPanel, Netlify, Vercel və ya GitHub Pages. `photos/` qovluğunu yükləmək lazım deyil.

- **Netlify:** faylı qovluqla birlikdə [app.netlify.com/drop](https://app.netlify.com/drop) səhifəsinə sürükləyin.
- **cPanel:** File Manager ilə `public_html` qovluğuna yükləyin.

## Vacib qeydlər

- **Əlaqə forması sorğuları heç yerə göndərmir.** Forma yalnız xanaların doldurulduğunu yoxlayır və "Sorğunuz qəbul olundu" yazısını göstərir. Sorğuların e-poçta gəlməsi üçün forma servisi (məsələn, Formspree və ya Netlify Forms) qoşulmalıdır.
- **Fayl böyükdür (~2 MB),** çünki fotolar içindədir. Yeni foto əlavə edəndə onu əvvəlcə kiçildin (bax: [YENILEME.md](YENILEME.md#fotolar)).
- Konsert tarixləri keçdikcə geri sayım avtomatik olaraq növbəti konsertə keçir. Bütün tarixlər keçəndə "Turne başa çatdı — yeni tarixlər tezliklə" yazısı çıxır.
