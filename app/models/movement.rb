class Movement < ApplicationRecord
  enum :types, { saida: 'saida', entrada: 'entrada' }

  belongs_to :user

  validates :description, :value, :types, presence: true

  validates :description, length: { maximum: 150 }

  validates :data, comparison: { less_than_or_equal_to: proc { Date.current } }


  validate :valid_is_exist_balance

  def self.current_balance
    entrada.sum(:value) - saida.sum(:value)
  end

  private

  def valid_is_exist_balance
    return unless user
    return if entrada?
    return if value.to_f <= user.movement.current_balance

    errors.add(:valor, 'é maior que o saldo atual')
  end
end
