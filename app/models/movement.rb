class Movement < ApplicationRecord
  validates :data, :description, :value, :types, presence: true

  enum :types, { saida: 'saida', entrada: 'entrada' }

  validate :valid_is_exist_balance

  def self.current_balance
    entrada.sum(:value) - saida.sum(:value)
  end

  private

  def valid_is_exist_balance
    return if entrada?
    return if value.to_f <= Movement.current_balance

    errors.add(:valor, 'é maior que o saldo atual')
  end
end
