# Ullmannite.rb
# 
# Created Wednesday, 9 September, 2015
# Alexander Rhett Crammer
#
Camping.goes :Ullmannite

# Models
module Ullmannite::Models
  class Site < Base
    self.table_name_prefix = '' # The tables' name shouldn't be prefixed (default is "ullmanite_")
  end
end

# Controllers
module Ullmannite::Controllers
  class Index < R '/'
    def get
      @sites = Models::Site.all
      render :welcome
    end
  end
end

# Views
module Ullmannite::Views
  def welcome
    html do
      head do
        title 'Alexander Rhett Crammer'
        # Metadata
        tag!(:meta,
          'http-equiv' => 'Content-Type',
          'content' => 'text/html; charset=UTF-8'
        )
        tag!(:meta,
          'id' => 'viewport',
          'name' => 'viewport',
          'content' => 'width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no'
        )
        tag!(:meta,
          'name' => 'description',
          'content' => "Alexander Rhett Crammer's portfolio."
        )
        tag!(:meta,
          'name' => 'author',
          'content' => 'Alexander Rhett Crammer'
        )
        tag!(:meta,
          'name' => 'generator',
          'content' => 'Coda 2, Camping (Ruby microframework), GitHub, MacBook Pro 15" (Late 2013), Ubuntu 15.04 Vivid Vervet.'
        )
        # Links
        tag!(:link,
          'rel' => 'stylesheet',
          'href' => 'Assets/Stylesheets/Main.css'
        )
      end
      body do
        div.container do
          @sites.map do |site|
            div.site do
              h4 do
                site.name[/^[0-9A-Za-z *]*\(/].to_s[0..-2] # Text before the first parenthesis (excluding the extra space and parenthesis)
              end # h4
              h6 do
                site.name[/\([0-9A-Za-z *]*\)/] # Text within and including the parentheses
              end # h6
              img :src => "Assets/Thumbnails/#{site.image}", :alt => site.image
            end # div.site
          end
        end
      end
    end
  end
end
