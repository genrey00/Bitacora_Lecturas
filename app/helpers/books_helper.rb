module BooksHelper
    # Concatenar el nombre y apellido del autor
    def author_full_name(book)
        "#{book.name_author} #{book.last_name_author}"
    end

    # Formatear la fecha en formato dd/mm/yyyy o mostrar un guion si es nula
    def format_date(date)
        date.present? ? date.strftime("%d/%m/%Y") : "No indicado"
    end

    # Mostrar el periodo de lectura del libro
    def period_lecture(book)
        "#{format_date(book.start_date)} - #{format_date(book.end_date)}"
    end

    # Obtener el nombre del estado del libro o "Sin estado" si no tiene
    def book_status_options(book)
        book.status&.name || "Sin estado"
    end
end
