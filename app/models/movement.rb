class Movement < ApplicationRecord
  enum :types, {saida: 'saida', entrada: 'entrada'}
end
