require 'httparty'

index = 1
while true do
	HTTParty.get("http://www.naver.com")
	index = index +1
	puts index
end
