require "rubygems"
require "httparty"
require 'open-uri'

system("cls") || system("clear")

logo = """

███╗░░░███╗██████╗░██████╗░██████╗░
████╗░████║██╔══██╗╚════██╗██╔══██╗
██╔████╔██║██████╔╝░█████╔╝██║░░██║
██║╚██╔╝██║██╔═══╝░░╚═══██╗██║░░██║
██║░╚═╝░██║██║░░░░░██████╔╝██████╔╝
╚═╝░░░░░╚═╝╚═╝░░░░░╚═════╝░╚═════╝░

     Youtube MP3 Downloader

       Author : Tegar Dev

     -[AsukaDev Official]-
÷=================================÷
"""

puts("#{logo}")
print("URL : ")
link = gets.chomp
print("Save file : ")
$save = gets.chomp
puts("÷=================================÷")
# https://www.youtube.com/watch?v=tOMFR0nQt48
response = HTTParty.get("https://api.zeks.xyz/api/ytmp3?url=#{link}&apikey=apivinz")
post = response.parsed_response
puts "Judul     : #{post['result']['title']}"
puts "Ukuran    : #{post['result']['size']}"
$audio = "#{post['result']['url_audio']}"
puts "URL Audio : #{$audio}"
puts "Thumbnail : #{post['result']['thumbnail']}"
puts "÷=================================÷"
print("Download Sekarang (y/n) : ")
pil = gets.chomp
if pil == "y"
  puts "Silahkan tunggu..."
  IO.copy_stream(URI.open("#{$audio}"), "#{$save}")
  puts "÷=================================÷"
  puts "Selesai Save : #{$save}"
else
  puts "÷=================================÷"
  puts "Anda membatalkan download"
end