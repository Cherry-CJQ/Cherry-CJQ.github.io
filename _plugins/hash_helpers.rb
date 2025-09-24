module Jekyll
  def hash_with_name(name)
    { 'name' => name, 'children' => [], 'full_path' => @context['path'] }
  end
  def index_of(array, item)
    array.index(item) || -1
  end
end