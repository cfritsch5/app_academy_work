require_relative 'diy_adts.rb'


m = Map.new
m.assign(:a,1)
m.assign(:b,2)
m.assign(:c,3)
m.assign(:d,4)

p m.show

p m.remove(:d)
p m.exists?(:d)
p m.lookup(:a)
p m.assign(:a,'z')
p m.show
