# -*- coding: utf-8 -*-
require_relative 'base'

module BibleRef
  module Languages
    class German < Base
      # Is it a single chapter book?
      def has_single_chapter?(reference)
        matches = [/^ob/, /^(jud|jd|jude)\b/, /^2 ?jo?h?n/, /^3 ?jo?h?n/, /^(philem|phm|pm)/]
        return Regexp.union(matches).match?(reference.downcase)
      end

      def books
        {
          'GEN' => { match: /^(gen|1\.? ?mose)/i, name: '1. Mose' },
          'EXO' => { match: /^(ex|2\.? mose)/i,  name: '2. Mose' },
          'LEV' => { match: /^(le?v|3\.? mose)/i,             name: '3. Mose'              },
          'NUM' => { match: /^(nu|4\.? mose)/i,               name: '4. Mose'                },
          'DEU' => { match: /^d(e?ut|eu|5\.? mose)/i,       name: '5. Mose'            },
          'JOS' => { match: /^jos/,              name: 'Josua'                 },
          'JDG' => { match: /^ju?dg/,            name: 'Richter'                 },
          'RUT' => { match: /^ru/,               name: 'Ruth'                   },
          '1SA' => { match: /^1 ?s(a?m|a)/,      name: '1. Samuel'               },
          '2SA' => { match: /^2 ?s(a?m|a)/,      name: '2. Samuel'               },
          '1KI' => { match: /^1 ?(king|kgs|ki)/, name: '1. Könige'                },
          '2KI' => { match: /^2 ?(king|kgs|ki)/, name: '2. Könige'                },
          '1CH' => { match: /^1 ?chr?/,          name: '1. Chronik'           },
          '2CH' => { match: /^2 ?chr?/,          name: '2. Chronik'           },
          'EZR' => { match: /^ezr/,              name: 'Esra'                   },
          'NEH' => { match: /^ne/,               name: 'Nehemias'               },
          'EST' => { match: /^est/,              name: 'Ester'                 },
          'JOB' => { match: /^(jo?b|hiob)/,             name: 'Hiob'                    },
          'PSA' => { match: /^ps/,               name: 'Psalmen'                 },
          'PRO' => { match: /^(pro?v|pro)/,      name: 'Sprüche'               },
          'ECC' => { match: /^ecc/,              name: 'Prediger'           },
          'SNG' => { match: /^so?ng|^sol|^sg$/,  name: 'Hohelied'        },
          'ISA' => { match: /^isa/,              name: 'Jesaja'                 },
          'JER' => { match: /^jer/,              name: 'Jeremia'               },
          'LAM' => { match: /^lam/,              name: 'Klagelieder'           },
          'EZK' => { match: /^ez(e|k)/,          name: 'Hesekiel'                },
          'DAN' => { match: /^dan/,              name: 'Daniel'                 },
          'HOS' => { match: /^hos/,              name: 'Hosea'                  },
          'JOL' => { match: /^joe?l/,            name: 'Joel'                   },
          'AMO' => { match: /^amo/,              name: 'Amos'                   },
          'OBA' => { match: /^ob/,               name: 'Obadja'                },
          'JON' => { match: /^jona?/,            name: 'Jona'                  },
          'MIC' => { match: /^mi/,               name: 'Micha'                  },
          'NAM' => { match: /^na(h|m)/,          name: 'Nahum'                  },
          'HAB' => { match: /^hab/,              name: 'Habakuk'               },
          'ZEP' => { match: /^zep/,              name: 'Zefania'              },
          'HAG' => { match: /^hag/,              name: 'Haggai'                 },
          'ZEC' => { match: /^zec/,              name: 'Sacharja'              },
          'MAL' => { match: /^mal/,              name: 'Maleachi'                },
          'TOB' => { match: /^tob/,              name: 'Tobit'                  },
          'JDT' => { match: /^(jth|jdth?|judith)/, name: 'Judit'               },
          'WIS' => { match: /^wis(dom)?/,        name: 'Weisheit'      },
          'SIR' => { match: /^sir/,              name: 'Sirach'                 },
          'BAR' => { match: /^bar/,              name: 'Baruch'                 },
          'LJE' => { match: /^(jeremy|lje)/,     name: 'Jeremy’s Letter'        },
          'S3Y' => { match: /^(3 holy|s3y)/,     name: '3 Holy Children’s Song' },
          'SUS' => { match: /^sus/,              name: 'Susanna'                },
          'BEL' => { match: /^bel/,              name: 'Bel and the Dragon'     },
          '1MA' => { match: /^1 ?mac?/,          name: '1 Maccabees'            },
          '2MA' => { match: /^2 ?mac?/,          name: '2 Maccabees'            },
          '1ES' => { match: /^1 ?esd?/,          name: '1 Esdras'               },
          'MAN' => { match: /^(prayer|man)/,     name: 'Prayer of Manasses'     },
          'PS2' => { match: /^(psalm 151|ps2)/,  name: 'Psalm 151'              },
          '3MA' => { match: /^3 ?mac?/,          name: '3 Maccabees'            },
          '2ES' => { match: /^2 ?esd?/,          name: '2 Esdras'               },
          '4MA' => { match: /^4 ?mac?/,          name: '4 Maccabees'            },
          'MAT' => { match: /^ma?t/,             name: 'Matthias'                },
          'MRK' => { match: /^(ma?rk|mk)/,       name: 'Markus'                   },
          'LUK' => { match: /^lu?k/,             name: 'Lukas'                   },
          'JHN' => { match: /^(john|jn|jhn)/,    name: 'Johannes'                   },
          'ACT' => { match: /^act/,              name: 'Apostelgeschichte'                   },
          'ROM' => { match: /^rom/,              name: 'Römer'                 },
          '1CO' => { match: /^1\.? ?cor?/,          name: '1. Korinther'          },
          '2CO' => { match: /^2\.? ?cor?/,          name: '2. Korinther'          },
          'GAL' => { match: /^gal/,              name: 'Galater'              },
          'EPH' => { match: /^eph/,              name: 'Epheser'              },
          'PHP' => { match: /^(phil$|philip|phillip|php|pp)/, name: 'Philipper' },
          'COL' => { match: /^col/,              name: 'Kolosser'             },
          '1TH' => { match: /^1 ?the?s?/,        name: '1. Thessalonicher'        },
          '2TH' => { match: /^2 ?the?s?/,        name: '2. Thessalonicher'        },
          '1TI' => { match: /^1 ?tim?/,          name: '1. Timotheus'              },
          '2TI' => { match: /^2 ?tim?/,          name: '2. Timotheus'              },
          'TIT' => { match: /^tit/,              name: 'Titus'                  },
          'PHM' => { match: /^(philem|phm|pm)/,  name: 'Philemon'               },
          'HEB' => { match: /^heb/,              name: 'Hebräer'                },
          'JAS' => { match: /^ja(m|s)/,          name: 'Jakobus'                  },
          '1PE' => { match: /^1 ?pet?/,          name: '1. Petrus'                },
          '2PE' => { match: /^2 ?pet?/,          name: '2. Petrus'                },
          '1JN' => { match: /^1 ?jo?h?n/,        name: '1. Johannes'                 },
          '2JN' => { match: /^2 ?jo?h?n/,        name: '2. Johannes'                 },
          '3JN' => { match: /^3 ?jo?h?n/,        name: '3. Johannes'                 },
          'JUD' => { match: /^(jud|jd|jude)$/,   name: 'Judas'                   },
          'REV' => { match: /^re?v/,             name: 'Offenbarung'             }
        }
      end
    end
  end
end
