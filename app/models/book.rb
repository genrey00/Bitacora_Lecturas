class Book < ApplicationRecord
    # validaciones que aseguran la presencia de los atributos necesarios
    validates :title, presence: true
    validates :name_author, presence: true
    validates :last_name_author, presence: true
    validates :start_date, presence: true
    
    # relaciones con otros modelos
    belongs_to :status, optional: true
end
