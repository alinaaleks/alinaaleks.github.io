module Jekyll

  class PostTagPage < Page

    def initialize(site, base, dir, tag, lang, layout)

      @site = site
      @base = base
      @dir  = dir
      @name = 'index.html'

      slug = tag.strip.downcase.gsub(/\s+/, '-')

      self.process(@name)

      self.read_yaml(
        File.join(base, '_layouts'),
        "#{layout}.html"
      )

      self.data['tag'] = tag
      self.data['title'] = tag
      self.data['layout'] = layout
      self.data['lang'] = lang

      # used by language switcher
      self.data['ref'] = "tag-#{slug}"

    end

  end


  class PostTagGenerator < Generator

    safe true


    def generate(site)

      return unless site.posts


      tag_dir =
        site.config['tag_page_dir'] || 'tag'

      layout =
        site.config['tag_page_layout'] || 'tag_page'

      languages =
        site.config['languages'] || ['ru', 'en']

      default_lang =
        site.config['default_lang'] || 'ru'


      tags =
        site.posts.docs
          .flat_map { |post| post.data['tags'] || [] }
          .uniq


      tags.each do |tag|

        slug = tag.strip.downcase.gsub(/\s+/, '-')


        languages.each do |lang|

          dir =
            if lang == default_lang
              File.join(tag_dir, slug)
            else
              File.join(lang, tag_dir, slug)
            end


          page = PostTagPage.new(
            site,
            site.source,
            dir,
            tag,
            lang,
            layout
          )


          page.data['permalink'] = "/#{dir}/"


          # store posts belonging to this tag
          page.data['posts'] =
            site.posts.docs.select do |post|

              post.data['lang'] == lang &&
              (post.data['tags'] || []).include?(tag)

            end


          site.pages << page

        end

      end

    end

  end

end