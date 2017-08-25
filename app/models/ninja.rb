class Ninja < ApplicationRecord
  validates :n_ninja, :n_mentor, :nome, :nome_ed, :contacto_ed, presence: true
end
