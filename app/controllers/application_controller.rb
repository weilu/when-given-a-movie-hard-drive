class ApplicationController < ActionController::Base
  protect_from_forgery

  def search_imdb movie_list
    movie_search = MovieSearch.create

    host = "http://www.imdb.com"
    #now = Time.now.strftime("%Y%m%d%I%M%p")
    #f = File.open("process_#{now}.log", 'a')

    movie_list.split("\n").each do |file|
      begin
        next if file.to_s =~ /^\./
        raw_title = file.to_s.gsub(/\.\w+$/, '')

        url = "#{host}/find?q=#{CGI.escape(raw_title)}"
        #f.write "Searching for #{raw_title}\n"

        page = Nokogiri::HTML(open url)
        first_link = page.css("a[href^='/title']")[0]
        next if first_link.nil? || first_link['href'][/\d*\/$/].nil?

        link = first_link['href']
        title = first_link.content
        #f.write "movie #{title} found at: #{link}\n"

        movie_page = Nokogiri::HTML(open host+link)
        star = movie_page.css('.star-box-giga-star')[0]
        next if star.nil?

        year = movie_page.css("a[href^='/year']")[0].content

        score = star.content.gsub(/\n/, '')
        logger.info "#{title}, #{year}, #{score}"
        movie_search.movies.create(name: title, year: year, rating: score)

        sleep Random.rand(5)

      rescue Exception => e
        #f.write e.message
        #f.write e.backtrace.inspect
        logger.error e.backtrace.inspec
      end
    end

    movie_search
  end
end
