module BooksHelper
    # Concatenar el nombre y apellido del autor
    def author_full_name(book)
        "#{book.name_author} #{book.last_name_author}"
    end

    # Formatear la fecha en formato dd/mm/yyyy o mostrar un guion si es nula
    def format_date(date)
        date.present? ? date.strftime("%d/%m/%Y") : "—"
end
end
