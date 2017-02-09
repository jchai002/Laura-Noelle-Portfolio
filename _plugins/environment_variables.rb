module Jekyll

  class EnvironmentVariablesGenerator < Generator

    def generate(site)
      git_head = `echo $(git symbolic-ref --short HEAD)`
      site.config['env'] = git_head.gsub("\n",'') || 'development'
    end

  end

end
