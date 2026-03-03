# _plugins/project_tags_generator.rb
module Jekyll
  class ProjectTagPage < Page
    def initialize(site, base, dir, tag, lang = 'en')
      @site = site
      @base = base
      @dir  = dir
      @name = 'index.html'

      # Convert tag to slug: "Power Query" → "power-query"
      slug = tag.strip.downcase.gsub(' ', '-')

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'tag_project.html')
      self.data['tag'] = tag
      self.data['title'] = tag.capitalize
      self.data['layout'] = 'tag_project'
      self.data['lang'] = lang

      # Unique ref for lang-switcher, begins with 'tag-project-'
      self.data['ref'] = "tag-project-#{slug}"
    end
  end

  class ProjectTagGenerator < Generator
    safe true

    def generate(site)
      return unless site.collections['projects']

      created = {} # track created pages to avoid duplicates

      # Get all unique tags from projects
      tags = site.collections['projects'].docs.flat_map { |p| p.data['tags'] || [] }.uniq

      tags.each do |tag|
        slug = tag.strip.downcase.gsub(' ', '-') # Power Query → power-query

        # English version
        key_en = "en/#{slug}"
        unless created[key_en]
          site.pages << ProjectTagPage.new(site, site.source, File.join('tag-project', slug), tag, 'en')
          created[key_en] = true
        end

        # Russian version
        key_ru = "ru/#{slug}"
        unless created[key_ru]
          site.pages << ProjectTagPage.new(site, site.source, File.join('ru', 'tag-project', slug), tag, 'ru')
          created[key_ru] = true
        end
      end
    end
  end
end