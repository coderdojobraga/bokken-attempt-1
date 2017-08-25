class Ninja < ApplicationRecord

	validates :nome, :nome_ed, :contacto_ed ,presence: true
	validates :n_ninja, :n_mentor, presence: true 

	
end
