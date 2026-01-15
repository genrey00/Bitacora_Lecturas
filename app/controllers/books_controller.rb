class BooksController < ApplicationController
    # Función para listar todos los libros o filtrar por estado
    def index
        @books = Book.por_status(params[:status_id]) || Book.all
    end

    # Función para mostrar un libro específico
    def show
        @book = Book.find(params[:id])
    end

    # Función para inicializar un nuevo libro
    def new
        @book = Book.new
    end

    # Función para crear un libro en la base de datos
    def create
        @book = Book.new(book_params)
        if @book.save
            redirect_to @book # redirecciona a la vista del libro recién creado
        else
            render 'new', status: :unprocessable_entity # vuelve a mostrar el formulario de nuevo libro y establece el estado HTTP a 422
        end
    end
    
    # Formulario para editar un libro existente
    def edit
        @book = Book.find(params[:id])
    end

    # Función para actualizar un libro existente
    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
            redirect_to @book # redirecciona a la vista del libro actualizado
        else
            render 'edit', status: :unprocessable_entity # vuelve a mostrar el formulario de edición
        end
    end

    # Función para eliminar un libro
    def destroy
        @book = Book.find(params[:id])
        if @book.destroy
            redirect_to books_path, notice: "Libro eliminado exitosamente."
        else
        redirect_to books_path, alert: @book.errors.full_messages.to_sentence
        end
    end

    # book_params es un método privado para permitir solo los parámetros permitidos
    private
    def book_params
        params.require(:book).permit(
            :title, 
            :name_author, 
            :last_name_author, 
            :start_date, 
            :end_date,
            :status_id
        )
    end
end

