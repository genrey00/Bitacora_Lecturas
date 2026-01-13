class Status < ApplicationRecord
    # relaciones con otros modelos
    has_many :books

    # validaciones que aseguran la presencia y unicidad del nombre del estado
    validates :name, presence: true, uniqueness: {case_sensitive: false}
end
