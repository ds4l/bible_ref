module BibleserverCom

  def generate_bibleserver_links(trans: "LUT", new_tab: true)
    bibleserver_url = "https://bibleserver.com/#{trans}"
    links = book_name + " "

    ranges_by_chapter = {}
    ranges.each do |range|
      ranges_by_chapter[range.first[:chapter]] ||= []
      ranges_by_chapter[range.first[:chapter]] << range
    end

    links + ranges_by_chapter.map do |chapter, ranges|
      verses = ranges.map do |(ref_from, ref_to)|
        if ref_from != ref_to
          "#{ref_from[:verse]}-#{ref_to[:verse]}"
        else
          if ref_from[:verse]
            "#{ref_from[:verse]}"
          else
            # Full chapter
            ""
          end
        end
      end.join(".")
      if verses.empty?
        reference = "#{chapter}"
        display = reference
      else
        reference = "#{chapter},#{verses}"
        display = reference
      end
      if new_tab
        "<a href=\"#{bibleserver_url}/#{book_name}#{reference}\" target=\"_blank\">#{display}</a>"
      else
        "<a href=\"#{bibleserver_url}/#{book_name}#{reference}\">#{display}</a>"
      end
    end.join("; ")
  end

end
