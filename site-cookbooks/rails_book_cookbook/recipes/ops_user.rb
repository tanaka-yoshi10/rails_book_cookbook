user 'ops'

group 'wheel' do
  action [:modify]
  members ["ops"]
  append true
end
