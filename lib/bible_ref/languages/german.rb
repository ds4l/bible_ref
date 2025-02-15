# -*- coding: utf-8 -*-
require_relative 'base'

module BibleRef
  module Languages
    class German < Base
      # Is it a single chapter book?
      def has_single_chapter?(reference)
        matches = [/^ob/, /^(jud|jd|jude)\b/, /^2\.? ?(jo?h?n|joh)/, /^3\.? ?(jo?h?n|joh)/, /^(philem|phm|pm)/]
        return Regexp.union(matches).match?(reference.downcase)
      end

      def books
        {
          'GEN' => { match: /^(gen|1\.? ?mose)/, name: '1. Mose' },
          'EXO' => { match: /^(ex|2\.? ?mose)/,  name: '2. Mose' },
          'LEV' => { match: /^(le?v|3\.? ?mose)/,             name: '3. Mose'              },
          'NUM' => { match: /^(nu|4\.? ?mose)/,               name: '4. Mose'                },
          'DEU' => { match: /^d(e?ut|eu)|^5\.? ?mose/,       name: '5. Mose'            },
          'JOS' => { match: /^jos/,              name: 'Josua'                 },
          'JDG' => { match: /^(ju?dg|ri)/,            name: 'Richter'                 },
          'RUT' => { match: /^ru/,               name: 'Ruth'                   },
          '1SA' => { match: /^1\.? ?s(a?m|a)/,      name: '1. Samuel'               },
          '2SA' => { match: /^2\.? ?s(a?m|a)/,      name: '2. Samuel'               },
          '1KI' => { match: /^1\.? ?(king|kgs|ki|kön)/, name: '1. Könige'                },
          '2KI' => { match: /^2\.? ?(king|kgs|ki|kön)/, name: '2. Könige'                },
          '1CH' => { match: /^1\.? ?chr?/,          name: '1. Chronik'           },
          '2CH' => { match: /^2\.? ?chr?/,          name: '2. Chronik'           },
          'EZR' => { match: /^(ezr|esr)/,              name: 'Esra'                   },
          'NEH' => { match: /^ne/,               name: 'Nehemias'               },
          'EST' => { match: /^est/,              name: 'Ester'                 },
          'JOB' => { match: /^(jo?b|hiob|ijob)/, name: 'Hiob'                    },
          'PSA' => { match: /^ps/,               name: 'Psalmen'                 },
          'PRO' => { match: /^(pro?v|pro|spr)/,  name: 'Sprüche'               },
          'ECC' => { match: /^(ecc|koh|pred)/,              name: 'Prediger'           },
          'SNG' => { match: /^so?ng|^sol|^sg$|^hld$|^hoh/,  name: 'Hohelied'        },
          'ISA' => { match: /^(isa|jes)/,              name: 'Jesaja'                 },
          'JER' => { match: /^jer/,              name: 'Jeremia'               },
          'LAM' => { match: /^(lam|klgl|kla)/,              name: 'Klagelieder'           },
          'EZK' => { match: /^ez(e|k)|^hes/,          name: 'Hesekiel'                },
          'DAN' => { match: /^dan/,              name: 'Daniel'                 },
          'HOS' => { match: /^hos/,              name: 'Hosea'                  },
          'JOL' => { match: /^joe?l/,            name: 'Joel'                   },
          'AMO' => { match: /^amo?/,              name: 'Amos'                   },
          'OBA' => { match: /^ob/,               name: 'Obadja'                },
          'JON' => { match: /^jona?/,            name: 'Jona'                  },
          'MIC' => { match: /^mi/,               name: 'Micha'                  },
          'NAM' => { match: /^na(h|m)/,          name: 'Nahum'                  },
          'HAB' => { match: /^hab/,              name: 'Habakuk'               },
          'ZEP' => { match: /^ze(p|f)/,              name: 'Zefania'              },
          'HAG' => { match: /^hag/,              name: 'Haggai'                 },
          'ZEC' => { match: /^(zec|sach)/,              name: 'Sacharja'              },
          'MAL' => { match: /^mal/,              name: 'Maleachi'                },
          'TOB' => { match: /^tob/,              name: 'Tobit'                  },
          'JDT' => { match: /^(jth|jdth?|judith|jdt)/, name: 'Judit'               },
          'WIS' => { match: /^wis(dom)?|^weis/,        name: 'Weisheit'      },
          'SIR' => { match: /^sir/,              name: 'Sirach'                 },
          'BAR' => { match: /^bar/,              name: 'Baruch'                 },
          'LJE' => { match: /^(jeremy|lje)/,     name: 'Jeremy’s Letter'        },
          'S3Y' => { match: /^(3 holy|s3y)/,     name: '3 Holy Children’s Song' },
          'SUS' => { match: /^sus/,              name: 'Susanna'                },
          'BEL' => { match: /^bel/,              name: 'Bel and the Dragon'     },
          '1MA' => { match: /^1\.? ?mac?/,          name: '1. Makkabäer'            },
          '2MA' => { match: /^2\.? ?mac?/,          name: '2. Makkabäer'            },
          '1ES' => { match: /^1 ?esd?/,          name: '1 Esdras'               },
          'MAN' => { match: /^(prayer|man)/,     name: 'Prayer of Manasses'     },
          'PS2' => { match: /^(psalm 151|ps2)/,  name: 'Psalm 151'              },
          '3MA' => { match: /^3\.? ?mac?/,          name: '3. Makkabäer'            },
          '2ES' => { match: /^2 ?esd?/,          name: '2 Esdras'               },
          '4MA' => { match: /^4\.? ?mac?/,          name: '4. Maccabees'            },
          'MAT' => { match: /^ma?t/,             name: 'Matthäus'                },
          'MRK' => { match: /^(ma?rk|mk)/,       name: 'Markus'                   },
          'LUK' => { match: /^lu?k/,             name: 'Lukas'                   },
          'JHN' => { match: /^(john|jn|jhn|joh)/,    name: 'Johannes'                   },
          'ACT' => { match: /^act|^ap/,              name: 'Apostelgeschichte'                   },
          'ROM' => { match: /^r(o|ö)m/,              name: 'Römer'                 },
          '1CO' => { match: /^1\.? ?(c|k)or?/,          name: '1. Korinther'          },
          '2CO' => { match: /^2\.? ?(c|k)or?/,          name: '2. Korinther'          },
          'GAL' => { match: /^gal/,              name: 'Galater'              },
          'EPH' => { match: /^eph/,              name: 'Epheser'              },
          'PHP' => { match: /^(phil$|philip|phillip|php|pp)/, name: 'Philipper' },
          'COL' => { match: /^(c|k)ol/,              name: 'Kolosser'             },
          '1TH' => { match: /^1\.? ?the?s?/,        name: '1. Thessalonicher'        },
          '2TH' => { match: /^2\.? ?the?s?/,        name: '2. Thessalonicher'        },
          '1TI' => { match: /^1\.? ?tim?/,          name: '1. Timotheus'              },
          '2TI' => { match: /^2\.? ?tim?/,          name: '2. Timotheus'              },
          'TIT' => { match: /^tit/,              name: 'Titus'                  },
          'PHM' => { match: /^(philem|phl?m|pm)/,  name: 'Philemon'               },
          'HEB' => { match: /^heb/,              name: 'Hebräer'                },
          'JAS' => { match: /^ja(m|s|k)/,          name: 'Jakobus'                  },
          '1PE' => { match: /^1\.? ?pet?/,          name: '1. Petrus'                },
          '2PE' => { match: /^2\.? ?pet?/,          name: '2. Petrus'                },
          '1JN' => { match: /^1\.? ?(jo?h?n|joh)/,        name: '1. Johannes'                 },
          '2JN' => { match: /^2\.? ?(jo?h?n|joh)/,        name: '2. Johannes'                 },
          '3JN' => { match: /^3\.? ?(jo?h?n|joh)/,        name: '3. Johannes'                 },
          'JUD' => { match: /^(jud|jd|jude)$/,   name: 'Judas'                   },
          'REV' => { match: /^(re?v|off)/,             name: 'Offenbarung'             }
        }
      end
    end
  end
end
