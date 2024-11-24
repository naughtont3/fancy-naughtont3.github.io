module Jekyll
  class ExtractCategoriesTags < Generator
    safe true

    def generate(site)
      categories = site.posts.docs.flat_map { |post| post.data['categories'] }.uniq
      tags = site.posts.docs.flat_map { |post| post.data['tags'] }.uniq

      File.open("_data/categories.yml", "w") { |f| f.puts(categories.sort.to_yaml) }
      File.open("_data/tags.yml", "w") { |f| f.puts(tags.sort.to_yaml) }
    end
  end
end

