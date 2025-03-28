#! /usr/bin/env sh

# Quick translation utility using `fuzzel` and `translate-shell`
# Written by Isti115 (on 2022-02-11)

# Dependencies:
# - fuzzel: https://codeberg.org/dnkl/fuzzel (Language selection and text entry)
# - translate-shell: https://github.com/soimort/translate-shell (Translation)

# Demo screencast: https://imgur.com/a/NYXpUHC

getlang () {(fuzzel --dmenu --prompt="$1" | sed 's/^.*\[\(.*\)\].*$/\1/g') << \
LANGUAGES
[af]  - Afrikaans
[sq]  - Albanian
[am]  - Amharic
[ar]  - Arabic
[hy]  - Armenian
[az]  - Azerbaijani
[eu]  - Basque
[be]  - Belarusian
[bn]  - Bengali
[bs]  - Bosnian
[bg]  - Bulgarian
[ca]  - Catalan
[ceb] - Cebuano
[zh]  - Chinese
[co]  - Corsican
[hr]  - Croatian
[cs]  - Czech
[da]  - Danish
[nl]  - Dutch
[en]  - English
[eo]  - Esperanto
[et]  - Estonian
[fi]  - Finnish
[fr]  - French
[fy]  - Frisian
[gl]  - Galician
[ka]  - Georgian
[de]  - German
[el]  - Greek
[gu]  - Gujarati
[ht]  - Haitian Creole
[ha]  - Hausa
[haw] - Hawaiian
[he]  - Hebrew
[hi]  - Hindi
[hmn] - Hmong
[hu]  - Hungarian
[is]  - Icelandic
[ig]  - Igbo
[id]  - Indonesian
[ga]  - Irish
[it]  - Italian
[ja]  - Japanese
[jv]  - Javanese
[kn]  - Kannada
[kk]  - Kazakh
[km]  - Khmer
[rw]  - Kinyarwanda
[ko]  - Korean
[ku]  - Kurdish
[ky]  - Kyrgyz
[lo]  - Lao
[lv]  - Latvian
[lt]  - Lithuanian
[lb]  - Luxembourgish
[mk]  - Macedonian
[mg]  - Malagasy
[ms]  - Malay
[ml]  - Malayalam
[mt]  - Maltese
[mi]  - Maori
[mr]  - Marathi
[mn]  - Mongolian
[my]  - Myanmar (Burmese)
[ne]  - Nepali
[no]  - Norwegian
[ny]  - Nyanja (Chichewa)
[or]  - Odia (Oriya)
[ps]  - Pashto
[fa]  - Persian
[pl]  - Polish
[pt]  - Portuguese (Portugal, Brazil)
[pa]  - Punjabi
[ro]  - Romanian
[ru]  - Russian
[sm]  - Samoan
[gd]  - Scots Gaelic
[sr]  - Serbian
[st]  - Sesotho
[sn]  - Shona
[sd]  - Sindhi
[si]  - Sinhala (Sinhalese)
[sk]  - Slovak
[sl]  - Slovenian
[so]  - Somali
[es]  - Spanish
[su]  - Sundanese
[sw]  - Swahili
[sv]  - Swedish
[tl]  - Tagalog (Filipino)
[tg]  - Tajik
[ta]  - Tamil
[tt]  - Tatar
[te]  - Telugu
[th]  - Thai
[tr]  - Turkish
[tk]  - Turkmen
[uk]  - Ukrainian
[ur]  - Urdu
[ug]  - Uyghur
[uz]  - Uzbek
[vi]  - Vietnamese
[cy]  - Welsh
[xh]  - Xhosa
[yi]  - Yiddish
[yo]  - Yoruba
[zu]  - Zulu
LANGUAGES
}
from=$(getlang "From: ")
if [ -z "$from" ]; then exit; fi
to=$(getlang "To: ")
if [ -z "$to" ]; then exit; fi
text=$(echo "" | fuzzel --dmenu --dmenu --prompt="Text: " --lines=1)
if [ -z "$text" ]; then exit; fi
trans -no-ansi $from:$to $text | fuzzel --dmenu --width=50 --lines=20
