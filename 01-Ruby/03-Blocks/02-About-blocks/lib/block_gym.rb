def tag(tag_name, attr = nil)
  attr_name = attr.nil? ? nil : attr.first
  attr_value = attr.nil? ? nil : attr.last

  open_tag = attr.nil? ? tag_name : "#{tag_name} #{attr_name}='#{attr_value}'"
  content = yield
  "<#{open_tag}>#{content}</#{tag_name}>"
end

def timer_for
  start_time = Time.now
  yield
  Time.now - start_time
end

def transform(element)
  yield element
end
