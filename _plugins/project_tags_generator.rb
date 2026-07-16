# _plugins/project_tags_generator.rb

module Jekyll

  class ProjectTagPage < Page

    def initialize(site, base, dir, tag, lang)
      @site = site
      @base = base
      @dir  = dir
      @name = 'index.html'

      slug = tag.strip.downcase.gsub(' ', '-')

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'tag_project.html')

      self.data['tag'] = tag
      self.data['title'] = tag
      self.data['layout'] = 'tag_project'
      self.data['lang'] = lang

      # Used by language switcher
      self.data['ref'] = "pj-tag-#{slug}"
    end

  end


  class ProjectTagGenerator < Generator

    safe true


    def generate(site)

      return unless site.collections['projects']


      # -----------------------------
      # Configuration
      # -----------------------------

      tag_dir = site.config['tag_project_page_dir'] || 'pj-tag'
      layout = site.config['tag_project_page_layout'] || 'tag_project'

      languages = site.config['languages'] || ['ru', 'en']
      default_lang = site.config['default_lang'] || 'ru'


      created = {}


      # -----------------------------
      # Collect tags
      # -----------------------------

      tags = site.collections['projects']
        .docs
        .flat_map { |p| p.data['tags'] || [] }
        .uniq


      tags.each do |tag|

        slug = tag.strip.downcase.gsub(' ', '-')


        languages.each do |lang|

          # Russian = no language prefix
          # English = /en/
          dir =
            if lang == default_lang
              File.join(tag_dir, slug)
            else
              File.join(lang, tag_dir, slug)
            end


          key = "#{lang}/#{slug}"

          next if created[key]


          page = ProjectTagPage.new(
            site,
            site.source,
            dir,
            tag,
            lang
          )


          # Explicit URL
          page.data['permalink'] = "/#{dir}/"


          site.pages << page

          created[key] = true

        end
      end

    end

  end

end