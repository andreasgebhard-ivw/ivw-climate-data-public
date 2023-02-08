# sanitize response body
def srb(response_body)
  h = JSON.parse(response_body).deep_symbolize_keys
  h[:object] = h[:object].to_h.deep_symbolize_keys
  h
end

def export_json(json, file_name:)
  str = JSON.parse(json).deep_symbolize_keys.pretty_inspect
  str.gsub!(/:(.+?)=>/, '"\1": ')
  str.gsub!(/: nil,/, ': null,')
  # str.gsub!('\"', '"')
  path = File.join Rails.root, 'data', 'json_exports', file_name
  File.open(path, 'w+') do |f|
    f.puts str
  end
  true
end

def ppp(hash)
  require 'pp'
  s = hash.pretty_inspect
  t = s.gsub(/:(.+?)=>/, '\1: ').gsub('"', "'")
  puts t
  true
end
