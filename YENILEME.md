# Saytı yeniləmək

Bütün dəyişikliklər `index.html` faylında edilir. Faylı VS Code kimi bir redaktorda açın və lazım olan yeri **Cmd+F** (Windows-da Ctrl+F) ilə axtarın.

> **Dəyişiklikdən əvvəl `index.html` faylının surətini saxlayın.** Nəsə səhv gedərsə, köhnə fayla qayıdarsınız.

Mündəricat:
[Əsas qayda: tərcümələr](#əsas-qayda-tərcümələr) · [Konsertlər](#konsertlər) · [Yeni klip](#yeni-klip) · [Rəqəmlər](#rəqəmlər) · [Xəbərlər](#xəbərlər) · [Əlaqə məlumatları](#əlaqə-məlumatları) · [Fotolar](#fotolar) · [Yoxlama](#yoxlama)

---

## Əsas qayda: tərcümələr

Saytdakı mətnlərin çoxu **iki yerdə** yazılıb:

1. **HTML-də**, məsələn: `<h3 data-i18n="ct_sam">Samara</h3>`
2. **Tərcümə cədvəlində.** Bu cədvəl faylın sonuna yaxın, `var I18N={` ilə başlayan uzun sətirdir:
   `"ct_sam": {"az": "Samara", "ru": "Самара", "en": "Samara"}`

Mətni yalnız HTML-də dəyişsəniz, ziyarətçi dili dəyişəndə köhnə mətn geri qayıdacaq. Buna görə:

- `data-i18n="..."` içindəki açarı (məsələn `ct_sam`) götürün.
- `"ct_sam":` yazıb axtarın.
- `az`, `ru` və `en` mətnlərinin üçünü də dəyişin.

Tərcümə mətnlərində dırnaq işarəsi `"` lazımdırsa, onu `\"` kimi yazın. Başqa bir yol da var: `“ ”` və ya `« »` işarələrindən istifadə edin.

---

## Konsertlər

Hər konsert **üç yerdə** olmalıdır.

### 1. Konsert siyahısı

`<ul class="shows` axtarın. Hər konsert belə bir blokdur:

```html
<li class="show">
  <div class="date"><b>24</b><span data-i18n="mo_sep">sentyabr 2026</span></div>
  <div><h3 data-i18n="ct_sam">Samara</h3><p data-i18n="v_sam">KRC Zvezda · başlama 19:00</p></div>
  <a class="btn" href="BİLET-LİNKİ" target="_blank" rel="noopener" data-i18n="c_buy">Bilet al</a>
</li>
```

**Yeni konsert:** bir bloku kopyalayın və bunları dəyişin:
- günü (`<b>24</b>`);
- ay açarını (`mo_sep`, `mo_oct`, `mo_dec`). Başqa ay lazımdırsa, tərcümə cədvəlinə yeni açar əlavə edin, məsələn `"mo_nov": {"az": "noyabr 2026", "ru": "ноября 2026", "en": "November 2026"}`;
- şəhər açarını (`ct_...`) və məkan açarını (`v_...`). Bunlar yeni açarlardır, adlarını özünüz seçin;
- bilet linkini (`href`).

Konsertləri tarix sırası ilə yazın. Keçmiş konserti bütün blokla birlikdə silin.

**Xüsusi etiket** ("Böyük konsert" kimi) şəhər adının yanına tərcümə mətninin içində yazılır:
`"ct_msk": {"az": "Moskva <span class=\"tag\">Böyük konsert</span>", ...}`

### 2. Geri sayım

`data-shows="` axtarın. Hər konsert `tarix|şəhər-açarı` formasında yazılır, konsertlər bir-birindən `;` ilə ayrılır:

```
data-shows="2026-09-24T19:00:00+04:00|ct_sam;2026-12-06T19:00:00+03:00|ct_msk"
```

- Tarixi `İL-AY-GÜNTSAAT:DƏQ:SAN+SAAT-QURŞAĞI` formasında yazın.
- Saat qurşağı konsertin keçirildiyi şəhərin vaxtıdır: Moskva, Sankt-Peterburq, Kazan, Krasnodar və Nijni Novqorod `+03:00`, Samara `+04:00`, Ufa `+05:00`, Bakı `+04:00`.
- Konsertləri tarix sırası ilə yazın. Geri sayım siyahıda gələcəkdə olan ilk tarixi götürür.

### 3. Tərcümələr

Yeni `ct_...`, `v_...` və `mo_...` açarlarını tərcümə cədvəlinə əlavə edin (bax: [Əsas qayda](#əsas-qayda-tərcümələr)). Məsələn:

```
"ct_baku": {"az": "Bakı", "ru": "Баку", "en": "Baku"}, "v_baku": {"az": "Heydər Əliyev Sarayı · başlama 20:00", "ru": "Дворец им. Гейдара Алиева · начало 20:00", "en": "Heydar Aliyev Palace · starts 20:00"},
```

Hər yeni açardan sonra vergül `,` qoymağı unutmayın.

Bölmənin giriş mətni (`c_lead`) və xronologiyadakı turne sətri (`tl5`) şəhərləri xatırladır. Lazım olsa, onları da yeniləyin.

---

## Yeni klip

YouTube linkindəki `v=`-dən sonrakı hissə videonun ID-sidir. Məsələn, `youtube.com/watch?v=wkLrPWz6hgQ` linkində ID `wkLrPWz6hgQ`-dir.

**Önə çıxan klipi dəyişmək üçün** köhnə ID-ni axtarın (hazırda `wkLrPWz6hgQ`). Bu ID bu yerlərdə var:

- ana ekrandakı "Yeni klipi izlə" düyməsi;
- Musiqi bölməsinin ilk kartı və ilk trek;
- Videolar bölməsindəki böyük kart;
- ilk xəbər.

**Klipi yeni ID ilə əvəz etmək kifayət deyil.** Mahnının adını, ilini və bu tərcümə açarlarını da yeniləyin: `h_dates`, `h_note`, `nw1_t`, `nw1_p`, `nw1_d`.

**Yeni klipi siyahıya əlavə etmək üçün** ən yaxşısı mövcud bir klipin kodunu kopyalayıb ID-ni, adı və ili dəyişməkdir. Klip üç yerdə görünür:

1. **Musiqi kartları:** `<button class="disc"` sətirlərindən birini kopyalayın. ID sətirdə iki dəfə yazılıb, hər ikisini dəyişin.
2. **Trek siyahısı:** `<li class="track">` blokunu kopyalayın. ID sətirdə iki dəfə yazılıb, hər ikisini dəyişin.
3. **Videolar:** `<button class="vcard"` blokunu kopyalayın. ID sətirdə iki dəfə yazılıb, hər ikisini dəyişin.

Ən yeni klipi siyahının əvvəlinə qoyun. Böyük kart (`class="vcard big"`) Videolar bölməsində birinci olmalıdır.

Klipin üz şəkli YouTube-dan avtomatik gəlir. Ayrıca şəkil yükləmək lazım deyil.

---

## Rəqəmlər

İzləyici sayları iki yerdədir: **Haqqında** bölməsi (`class="facts`) və **Brendlər** bölməsi (`class="mk-stats`).

```html
<b data-count="736" data-suffix="K">736K</b>
```

Rəqəm üç yerdə yazılıb: `data-count`-da, `data-suffix`-də (`K`, `M`, `+` və ya boş) və teqin içində. Üçünü də yeniləyin. Rəqəm ekrana gələndə 0-dan sayılaraq böyüyür.

---

## Xəbərlər

`class="news-grid` axtarın. Hər xəbər `<a class="news" ...>` blokudur. Hər xəbərin üç tərcümə açarı var: tarix (`nw1_d`), başlıq (`nw1_t`) və mətn (`nw1_p`).

**Yeni xəbər:**
- bloku kopyalayın;
- linki və mənbəni (`class="src"`) dəyişin;
- yeni açarlar verin (`nw4_d`, `nw4_t`, `nw4_p`) və onları tərcümə cədvəlinə əlavə edin.

Ekranda 3 xəbər olanda görünüş ən səliqəlidir. Yenisini əvvələ qoyun, ən köhnəsini silin.

---

## Əlaqə məlumatları

| Nə | Harada axtarmaq |
|---|---|
| Menecer telefonu | `tel:+994` və tərcümə açarı `"k_mgr"` |
| Rusiya konsert direktoru | `tel:+7` və tərcümə açarı `"k_rus"` |
| Instagram / YouTube / TikTok | `instagram.com`, `youtube.com/@`, `tiktok.com`. Bunlar həm Əlaqə bölməsində, həm də footer-dədir. |
| Spotify / Apple Music | `open.spotify.com/artist`, `music.apple.com`. Hər biri faylda bir neçə dəfə yazılıb, hamısını əvəz edin. |

Telefonun `href="tel:..."` hissəsində boşluq olmamalıdır.

---

## Fotolar

Saytdakı fotolar `img/` qovluğundadır:

| Fayl | Harada görünür |
|---|---|
| `img/hero.jpg` | Ana ekran |
| `img/portrait.jpg` | Haqqında bölməsi (portret) |
| `img/gallery-01.jpg` … `img/gallery-11.jpg` | Qalereya, soldan sağa sıra ilə |

### Fotonu dəyişmək

1. **Fotonu kiçildin.** Eni 1200 pikseldən böyük olmasın, format JPG olsun. macOS-da terminalda:
   ```bash
   sips -Z 1200 -s formatOptions 80 yeni-foto.jpg
   ```
2. **Köhnə faylın yerinə qoyun.** Yeni fotonun adını dəyişdirilən faylın adı ilə eyni edin (məsələn `gallery-05.jpg`) və `img/` qovluğundakı köhnə faylın üstünə yazın.

`index.html`-də heç nə dəyişmək lazım deyil.

> **Fotonu `index.html`-in içinə kod (base64) kimi yerləşdirməyin.** Əvvəl fotolar belə idi: fayl 2 MB-a çatırdı və sayt açılanda bölmələr 20 saniyəyə qədər boş görünürdü.

### Qalereyaya yeni foto əlavə etmək

1. Fotonu `img/gallery-12.jpg` adı ilə saxlayın.
2. `index.html`-də `data-full="gl11"` axtarın və həmin sətri kopyalayıb altına yapışdırın.
3. Yeni sətirdə üç yeri dəyişin:
   - `gl11` → `gl12` (iki yerdə);
   - `gallery-11.jpg` → `gallery-12.jpg`.
4. Tərcümə cədvəlinə fotonun üstündəki yazını əlavə edin:
   `"gl12": {"az": "Konsert", "ru": "Концерт", "en": "Concert"},`

### Qalereyada fotonun ölçüsü

Qalereyadakı fotonun ölçüsü düymənin sinfindən asılıdır:
- `class="ph"` normal ölçüdür;
- `class="ph tall"` iki sətir hündürlüyündədir (şaquli fotolar üçün);
- `class="ph wide"` iki sütun enindədir (üfüqi fotolar üçün).

---

## Yoxlama

Hər dəyişiklikdən sonra:

1. `index.html` faylını brauzerdə açın.
2. **AZ / RU / EN** düymələrini basın. Mətnlər üç dildə düzgün olmalıdır.
3. Geri sayımın düzgün şəhəri göstərdiyini yoxlayın.
4. Bir klipə və bir bilet linkinə klikləyin.
5. Sayt tamamilə boş və ya "ölü" görünürsə (düymələr işləmir), çox güman ki, tərcümə cədvəlində vergül və ya dırnaq səhvi var. Son dəyişikliyə baxın və ya ehtiyat surətə qayıdın.
6. Dəyişiklikləri GitHub-a göndərin:
   ```bash
   git add -A
   git commit -m "Konsert tarixləri yeniləndi"
   git push
   ```
   1–2 dəqiqədən sonra dəyişiklik **rozazergerli.com**-da görünəcək.
