module BooksHelper

    # Formatear la fecha en formato dd/mm/yyyy o mostrar un guion si es nula
    def format_date(date)
        date.present? ? date.strftime("%d/%m/%Y") : "No indicado"
    end

    # Mostrar el periodo de lectura del libro
    def period_lecture(book)
        "#{format_date(book.start_date)} - #{format_date(book.end_date)}"
    end
    
    # Generar una etiqueta HTML para el estado del libro con estilos específicos
    def book_status_label(book)
        case book.status&.name
        when "Pendiente"
            content_tag(:span, "Pendiente", class: "status status-pendiente")
        when "Leyendo"
            content_tag(:span, "Leyendo", class: "status status-leyendo")
        when "Terminado"
            content_tag(:span, "Terminado", class: "status status-terminado")
        else
            content_tag(:span, "Sin estado", class: "status status-sin-estado")
        end
    end
end
