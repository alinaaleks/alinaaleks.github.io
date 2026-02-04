module Jekyll
  class ProjectTagPage < Page
    def initialize(site, base, dir, tag)
      @site = site
      @base = base
      @dir  = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'tag_project.html')
      self.data['tag'] = tag
      self.data['title'] = tag.capitalize
      self.data['layout'] = 'tag_project'
    end
  end

  class ProjectTagGenerator < Generator
    safe true

    def generate(site)
      if site.collections['projects']
        tags = site.collections['projects'].docs.flat_map { |p| p.data['tags'] || [] }.uniq
        tags.each do |tag|
          site.pages << ProjectTagPage.new(site, site.source, File.join('tag-project', tag.downcase), tag)
        end
      end
    end
  end
end
