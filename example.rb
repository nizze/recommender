require 'rubygems'
require 'json'
require 'pp'
require 'matrix'


FILE_IN = "/Users/nisse/ivan/recommend/doc/data.json"


data = {
  '1' => [5,5,0,5],
  '2' => [5,0,3,4],
  '3' => [3,4,0,3],
  '4' => [0,0,5,3],
  '5' => [5,4,4,5],
  '6' => [5,4,5,5],
}

File.open(FILE_IN, 'w') do |f|
  f.write(data.values.to_s + "\n\n")
end

# method similar users
# in  :  a user([Float])
# out :  [user]

def similar user
  #somethig
  #somethig
  out = JSON.parse(%x|java -jar /Users/nisse/ivan/recommender.jar #{FILE_IN}|)

  u = Matrix[*out[1]]
  s = Matrix[*out[0]]
  vt = Matrix[out[2]].transpose

  #pp u.column(0)

  #user.transpose * Matrix[u.column(0), u.column(1)]
  p (s * Matrix[s.column(0), s.column(1)])

end


 similar_users = similar(Matrix[[5,5,0,0,0,5]])

