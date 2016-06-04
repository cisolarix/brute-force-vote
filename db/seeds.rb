file = Rails.root.join('db', 'ip.txt')

File.open(file, 'r') do |f|
  while (line = f.gets.try(:chomp))
    Ip.find_or_create_by(address: line)
  end
end
