class NotesController < ApplicationController
  before_action :find_note, only: %i[show edit update destroy]
  def show
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)

    if @note.save
      redirect_to @note
    else
      render :new
    end
  end
  private

    def find_note
      @note = Note.find(params[:id])
    end

    def note_params
      params.require(:note).permit(:title, :content)
    end
end
