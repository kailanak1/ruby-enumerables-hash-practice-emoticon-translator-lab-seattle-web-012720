require 'yaml' # require modules here
require 'pry'

def load_library(file_path)
  hash = {}
     hash = {
        "get_meaning" => {}  , 
        "get_emoticon"=> {} 
      } 
  file = File.read(file_path)
  emoticons = YAML.load(file)
    emoticons.each do |meaning, emoji_pairs|
      jpn_emoji = emoticons[meaning] = emoji_pairs.last
      eng_emoji = emoticons[meaning] = emoji_pairs.first
      
      
      hash["get_meaning"][jpn_emoji] = meaning
      hash["get_emoticon"][eng_emoji] = jpn_emoji
    end 
    hash 
end 

def get_japanese_emoticon(file_path, emoticon)
  emoticons = load_library(file_path)
  if emoticons["get_emoticon"][emoticon]
    emoticons["get_emoticon"][emoticon]
  else 
    "Sorry, that emoticon was not found"
  end 
end

def get_english_meaning(file_path, emoticon)
  emoticons = load_library(file_path)
  if emoticons["get_meaning"][emoticon]
   emoticons["get_meaning"][emoticon]
 else 
   "Sorry, that emoticon was not found"
  end 
end