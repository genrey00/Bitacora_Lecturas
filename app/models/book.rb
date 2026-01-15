class Book < ApplicationRecord
    # validaciones que aseguran la presencia de los atributos necesarios
    validates :title, presence: true
    validates :name_author, presence: true
    validates :last_name_author, presence: true
    validates :start_date, presence: true
    validate :fecha_final_despues_fecha_inicio
    before_destroy :no_eliminar_sin_fecha_final
    validate :titulo_unico

      # Concatenar el nombre y apellido del autor
    def author_full_name
        "#{name_author} #{last_name_author}"
    end

    private
    def fecha_final_despues_fecha_inicio
        # Verifica que la fecha de finalización sea posterior a la fecha de inicio
        return if end_date.blank? || start_date.blank?
        # Agrega un error si la fecha de finalización es anterior a la fecha de inicio
        if end_date < start_date
            errors.add(:base, "La fecha de finalización debe ser posterior a la fecha de inicio")
        end
    end

    # Scope para filtrar libros por estado
    scope :por_status, ->(status_id) { where(status_id: status_id) if status_id.present? }

    def no_eliminar_sin_fecha_final
        # Evita la eliminación del libro si no tiene una fecha de finalización
        if end_date.blank?
            errors.add(:base, "No se puede eliminar un libro sin fecha de finalización")
            throw(:abort)
        end
    end

    def titulo_unico
        # Verifica que el título del libro sea único
        if Book.exists?(title: title)
            errors.add(:base, "El título del libro ya existe")
        end
    end

    # relaciones con otros modelos
    belongs_to :status, optional: true
end
