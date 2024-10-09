//
//  OriginalLanguage.swift
//  Models
//
//  Created by Manuel Lopes on 09.10.24.
//

import Foundation

// swiftlint:disable all
public enum OriginalLanguage: String, CaseIterable, Codable, Hashable, Sendable {
    case ab
    case aa
    case af
    case ak
    case sq
    case am
    case ar
    case an
    case hy
    case `as` = "as"
    case av
    case ae
    case ay
    case az
    case bm
    case ba
    case eu
    case be
    case bn
    case bh
    case bi
    case bs
    case br
    case bg
    case my
    case ca
    case ch
    case ce
    case cn
    case ny
    case zh
    case cv
    case kw
    case co
    case cr
    case hr
    case cs
    case da
    case dv
    case nl
    case dz
    case en
    case eo
    case et
    case ee
    case fo
    case fj
    case fi
    case fr
    case ff
    case gl
    case ka
    case de
    case el
    case gn
    case gu
    case ht
    case ha
    case he
    case hz
    case hi
    case ho
    case hu
    case ia
    case id
    case ie
    case ga
    case ig
    case ik
    case io
    case `is` = "is"
    case it
    case iu
    case ja
    case jv
    case kl
    case kn
    case kr
    case ks
    case kk
    case km
    case ki
    case rw
    case ky
    case kv
    case kg
    case ko
    case ku
    case kj
    case la
    case lb
    case lg
    case li
    case ln
    case lo
    case lt
    case lu
    case lv
    case gv
    case mk
    case mg
    case ms
    case ml
    case mt
    case mi
    case mr
    case mh
    case mn
    case na
    case nv
    case nd
    case ne
    case ng
    case nb
    case nn
    case no
    case ii
    case nr
    case oc
    case oj
    case cu
    case om
    case or
    case os
    case pa
    case pi
    case fa
    case pox
    case pl
    case ps
    case pt
    case qu
    case rm
    case rn
    case ro
    case ru
    case sa
    case sc
    case sd
    case se
    case sm
    case sg
    case sr
    case gd
    case sn
    case si
    case sk
    case sl
    case so
    case st
    case es
    case su
    case sw
    case ss
    case sv
    case ta
    case te
    case tg
    case th
    case ti
    case bo
    case tk
    case tl
    case tn
    case to
    case tr
    case ts
    case tt
    case tw
    case ty
    case ug
    case uk
    case ur
    case uz
    case ve
    case vi
    case vo
    case wa
    case cy
    case wo
    case fy
    case xh
    case yi
    case yo
    case za
    case zu
    case xx
}

extension OriginalLanguage {

    public var language: String {
        switch self {
        case .ab: return "Abkhazian"
        case .aa: return "Afar"
        case .af: return "Afrikaans"
        case .ak: return "Akan"
        case .sq: return "Albanian"
        case .am: return "Amharic"
        case .ar: return "Arabic"
        case .an: return "Aragonese"
        case .hy: return "Armenian"
        case .as: return "Assamese"
        case .av: return "Avaric"
        case .ae: return "Avestan"
        case .ay: return "Aymara"
        case .az: return "Azerbaijani"
        case .bm: return "Bambara"
        case .ba: return "Bashkir"
        case .eu: return "Basque"
        case .be: return "Belarusian"
        case .bn: return "Bengali"
        case .bh: return "Bihari languages"
        case .bi: return "Bislama"
        case .bs: return "Bosnian"
        case .br: return "Breton"
        case .bg: return "Bulgarian"
        case .my: return "Burmese"
        case .ca: return "Catalan, Valencian"
        case .ch: return "Chamorro"
        case .ce: return "Chechen"
        case .ny: return "Chichewa, Chewa, Nyanja"
        case .zh: return "Chinese"
        case .cn: return "Chinese"
        case .cv: return "Chuvash"
        case .kw: return "Cornish"
        case .co: return "Corsican"
        case .cr: return "Cree"
        case .hr: return "Croatian"
        case .cs: return "Czech"
        case .da: return "Danish"
        case .dv: return "Divehi, Dhivehi, Maldivian"
        case .nl: return "Dutch, Flemish"
        case .dz: return "Dzongkha"
        case .en: return "English"
        case .eo: return "Esperanto"
        case .et: return "Estonian"
        case .ee: return "Ewe"
        case .fo: return "Faroese"
        case .fj: return "Fijian"
        case .fi: return "Finnish"
        case .fr: return "French"
        case .ff: return "Fulah"
        case .gl: return "Galician"
        case .ka: return "Georgian"
        case .de: return "German"
        case .el: return "Greek (modern),"
        case .gn: return "Guaraní"
        case .gu: return "Gujarati"
        case .ht: return "Haitian, Haitian Creole"
        case .ha: return "Hausa"
        case .he: return "Hebrew (modern),"
        case .hz: return "Herero"
        case .hi: return "Hindi"
        case .ho: return "Hiri Motu"
        case .hu: return "Hungarian"
        case .ia: return "Interlingua"
        case .id: return "Indonesian"
        case .ie: return "Interlingue"
        case .ga: return "Irish"
        case .ig: return "Igbo"
        case .ik: return "Inupiaq"
        case .io: return "Ido"
        case .is: return "Icelandic"
        case .it: return "Italian"
        case .iu: return "Inuktitut"
        case .ja: return "Japanese"
        case .jv: return "Javanese"
        case .kl: return "Kalaallisut, Greenlandic"
        case .kn: return "Kannada"
        case .kr: return "Kanuri"
        case .ks: return "Kashmiri"
        case .kk: return "Kazakh"
        case .km: return "Central Khmer"
        case .ki: return "Kikuyu, Gikuyu"
        case .rw: return "Kinyarwanda"
        case .ky: return "Kirghiz, Kyrgyz"
        case .kv: return "Komi"
        case .kg: return "Kongo"
        case .ko: return "Korean"
        case .ku: return "Kurdish"
        case .kj: return "Kuanyama, Kwanyama"
        case .la: return "Latin"
        case .lb: return "Luxembourgish, Letzeburgesch"
        case .lg: return "Ganda"
        case .li: return "Limburgan, Limburger, Limburgish"
        case .ln: return "Lingala"
        case .lo: return "Lao"
        case .lt: return "Lithuanian"
        case .lu: return "Luba-Katanga"
        case .lv: return "Latvian"
        case .gv: return "Manx"
        case .mk: return "Macedonian"
        case .mg: return "Malagasy"
        case .ms: return "Malay"
        case .ml: return "Malayalam"
        case .mt: return "Maltese"
        case .mi: return "Maori"
        case .mr: return "Marathi"
        case .mh: return "Marshallese"
        case .mn: return "Mongolian"
        case .na: return "Nauru"
        case .nv: return "Navajo, Navaho"
        case .nd: return "North Ndebele"
        case .ne: return "Nepali"
        case .ng: return "Ndonga"
        case .nb: return "Norwegian Bokmål"
        case .nn: return "Norwegian Nynorsk"
        case .no: return "Norwegian"
        case .ii: return "Sichuan Yi, Nuosu"
        case .nr: return "South Ndebele"
        case .oc: return "Occitan"
        case .oj: return "Ojibwa"
        case .cu: return "Church Slavic, Church Slavonic, Old Church Slavonic, Old Slavonic, Old Bulgarian"
        case .om: return "Oromo"
        case .or: return "Oriya"
        case .os: return "Ossetian, Ossetic"
        case .pa: return "Panjabi, Punjabi"
        case .pi: return "Pali"
        case .fa: return "Persian"
        case .pox: return "Polabian"
        case .pl: return "Polish"
        case .ps: return "Pashto, Pushto"
        case .pt: return "Portuguese"
        case .qu: return "Quechua"
        case .rm: return "Romansh"
        case .rn: return "Rundi"
        case .ro: return "Romanian, Moldavian, Moldovan"
        case .ru: return "Russian"
        case .sa: return "Sanskrit"
        case .sc: return "Sardinian"
        case .sd: return "Sindhi"
        case .se: return "Northern Sami"
        case .sm: return "Samoan"
        case .sg: return "Sango"
        case .sr: return "Serbian"
        case .gd: return "Gaelic, Scottish Gaelic"
        case .sn: return "Shona"
        case .si: return "Sinhala, Sinhalese"
        case .sk: return "Slovak"
        case .sl: return "Slovenian"
        case .so: return "Somali"
        case .st: return "Southern Sotho"
        case .es: return "Spanish, Castilian"
        case .su: return "Sundanese"
        case .sw: return "Swahili"
        case .ss: return "Swati"
        case .sv: return "Swedish"
        case .ta: return "Tamil"
        case .te: return "Telugu"
        case .tg: return "Tajik"
        case .th: return "Thai"
        case .ti: return "Tigrinya"
        case .bo: return "Tibetan"
        case .tk: return "Turkmen"
        case .tl: return "Tagalog"
        case .tn: return "Tswana"
        case .to: return "Tonga (Tonga Islands),"
        case .tr: return "Turkish"
        case .ts: return "Tsonga"
        case .tt: return "Tatar"
        case .tw: return "Twi"
        case .ty: return "Tahitian"
        case .ug: return "Uighur, Uyghur"
        case .uk: return "Ukrainian"
        case .ur: return "Urdu"
        case .uz: return "Uzbek"
        case .ve: return "Venda"
        case .vi: return "Vietnamese"
        case .vo: return "Volapük"
        case .wa: return "Walloon"
        case .cy: return "Welsh"
        case .wo: return "Wolof"
        case .fy: return "Western Frisian"
        case .xh: return "Xhosa"
        case .yi: return "Yiddish"
        case .yo: return "Yoruba"
        case .za: return "Zhuang, Chuang"
        case .zu: return "Zulu"
        case .xx: return "Unkown"
        }
    }

    /// Create a new code instance from a language name
    init?(language: String) {
        for code in OriginalLanguage.allCases {
            if code.language.lowercased() == language.lowercased() {
                self = code
                return
            }
        }
        
        return nil
    }
    
    /// Create a new code instance from a language name
    init?(isoCode: String) {
        for code in OriginalLanguage.allCases {
            if isoCode.lowercased() == code.rawValue {
                self = code
                return
            }
        }
        
        return nil
    }
}

// swiftlint:enable all
