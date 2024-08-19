require 'csv'

#
# data = CSV.parse(DATA.read, headers: :first_row).map { |e| e.to_h.transform_keys(&:to_sym) }
#
# query = -> { _1 in { color: 'black', doors: '2' } }
#
# pp data.grep query
#
#
# pp data.select(&query)
#

data = CSV.parse(DATA.read, headers: :first_row).map { |e| e.to_h.transform_keys(&:to_sym) }

params = { }

print 'Select a color: '
params[:color] = gets.chomp
print "#{params[:color]} was selected\n"

print 'Select a number of doors: '
params[:doors] = gets.chomp
print "#{params[:doors]} was selected\n"

query = -> { _1 in { doors: '2', color: 'black' } }

p data.select(&query)

__END__
make,model,color,doors
dodge,charger,black,4
ford,focus,blue,5
nissan,350z,black,2
mazda,miata,white,2
honda,civid,brown,4
corvette,stingray,red,2
ford,fiesta,blue,5
bmw,m4,black,2
audi,a5,blue,2
subaru,brz,black,2
lexus,rc,black,2
