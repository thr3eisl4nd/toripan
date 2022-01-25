class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'バゲット' },
    { id: 3, name: 'ハード' },
    { id: 4, name: 'ライハード'},
    { id: 5, name: 'セミハード'},
    { id: 6, name: 'スペシャリテ' },
    { id: 7, name: '食パン' },
    { id: 8, name: '菓子パン' },
    { id: 9, name: 'デニッシュ'},
    { id: 10, name: 'ドゥナッツ'},
    { id: 11, name: 'うさもぐ' },
    { id: 12, name: '焼き菓子' },
    { id: 13, name: 'ビストロサンド' },
    { id: 14, name: 'バゲットサンド'},
    { id: 15, name: 'ホットサンド'}
  ]

  include ActiveHash::Associations
  has_many :items
end