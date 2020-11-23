class Serving < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '1〜2人前' },
    { id: 3, name: '2〜3人前' },
    { id: 4, name: '3〜4人前' },
    { id: 5, name: '4〜5人前' },
    { id: 6, name: '5〜6人前' },
  ]
  
  include ActiveHash::Associations
  has_many :recipes
end
