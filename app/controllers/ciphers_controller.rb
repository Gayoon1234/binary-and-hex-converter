class CiphersController < ApplicationController
  def vigenere
    data, key = params["data"],params["key"]
    @solution = vCipher(data,key) if data && key && params["encode"]
    @solution ||= dvCipher(data,key) if params["decode"]
    @data, @key = data,key
  end

  def ceaser
  end

  def rot13
  end

  def rot47
  end

  def randomSub
  end

  def morse
  end

  #these methods need to handle punctuation
  def vCipher(word, key)
    @alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
      word.upcase!
      key.upcase!
      currentkey = -1
      sol = ""
      word.each_byte do |letter|
          (sol += letter.chr; next) if letter < 65 || letter > 90
          currentkey += 1
          key_char = key[currentkey % key.length].bytes.shift
          sol << @alphabet[(letter+key_char)%26]
      end
      sol.to_s
  end

  def dvCipher(word, key)
    @alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    word.upcase!
    key.upcase!
    currentkey = -1
    sol = ""
    word.each_byte do |letter|
      (sol += letter.chr; next) if letter < 65 || letter > 90
      currentkey += 1
        key_char = key[currentkey % key.length].bytes.shift
        sol << @alphabet[(letter-key_char)%26]
    end
    sol.to_s
  end


end
