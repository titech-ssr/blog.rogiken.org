module Larry
  module BlogMember
    # HTMLEscape: `h()`
    include Nanoc::Helpers::HTMLEscape

    def author_year_name_variation(author_str)
      /(\d+)\/([^\/]+)(?:\/([^\/]+))?/.match(author_str).captures
    end

    def create_authors_htags(items=articles)
      items.each do |item|
        if authors = item[:authors]
          authors.each do |author|
            year,author_name,variation = author_year_name_variation(author)
            item[:htags] ||= []
            item[:htags].push("author/#{year}/#{author_name}")
          end
        end
      end
    end

    def member_year(item=@item)
      /^\/members\/([0-9]+)\/.*$/.match(item.identifier.to_s).captures[0]
    end

  end
end

include Larry::BlogMember
