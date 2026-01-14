class Book < ApplicationRecord
    # validaciones que aseguran la presencia de los atributos necesarios
    validates :title, presence: true
    validates :name_author, presence: true
    validates :last_name_author, presence: true
    validates :start_date, presence: true
    validate :end_date_after_start_date

      # Concatenar el nombre y apellido del autor
    def author_full_name
        "#{name_author} #{last_name_author}"
    end

    private
    def end_date_after_start_date
        # Verifica que la fecha de finalización sea posterior a la fecha de inicio
        return if end_date.blank? || start_date.blank?
        # Agrega un error si la fecha de finalización es anterior a la fecha de inicio
        if end_date < start_date
            errors.add(:base, "La fecha de finalización debe ser posterior a la fecha de inicio")
        end
    end

    # Scope para filtrar libros por estado
    scope :por_status, ->(status_id) { where(status_id: status_id) if status_id.present? }

    # relaciones con otros modelos
    belongs_to :status, optional: true
end
