require 'sinatra'
require 'sinatra/reloader' if development?


def caesar_cipher(string, num)
    @cipher = ""

    string.each_char do |ch|
      ch = ch.ord
      if ch.between?(97, 122)
        shift = ch += (num % 26)
            if shift > 122 
                shift = (ch - 123 + 97).chr
            end
       elsif ch.between?(65, 90)
         shift = ch += (num % 26)
            if shift > 90 
                shift = (ch - 91 + 65).chr
            end
       else
        shift = ch.chr
       end
      
      @cipher << shift
    end
    return @cipher

end

get '/' do
    string = params["string"] || ""
    num = params["num"].to_i
    @cipher = caesar_cipher(string, num)
    erb :index, :locals => { :cipher => @cipher }
end
