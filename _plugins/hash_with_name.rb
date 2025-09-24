Jekyll::Hooks.register :site, :post_read do
  Liquid::Template.register_filter Jekyll
end

module Jekyll
  def hash_with_name(name)
    { 'name' => name, 'children' => [], 'full_path' => @context['path'] }
  end
  def index_of(array, item)
    array.index(item) || -1
  end
end