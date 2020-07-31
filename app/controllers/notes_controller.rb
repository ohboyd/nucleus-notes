class NotesController < ApplicationController
  before_action :find_note, only: %i[show edit update destroy complete]
  before_action :authenticate_user!

  def index
    @notes = policy_scope(Note).unfinished.order(updated_at: :desc).with_rich_text_content_and_embeds
  end

  def show
  end

  def new
    @note = current_user.notes.build
  end

  def create
    @note = current_user.notes.build(note_params)

    if @note.save
      redirect_to @note
      flash[:notice] = 'Note successfully created!'
    else
      flash[:alert] = "Unable to create note: #{@note.errors.full_messages.join(', ')}"
      render :new
    end
  end

  def edit
  end

  def update
    if @note.update(note_params)
      redirect_to @note
      flash[:notice] = 'Note successfully updated!'
    else
      flash[:alert] = "Unable to update note: #{@note.errors.full_messages.join(', ')}"
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to notes_path, alert: 'Note successfully deleted!'
  end

  def complete
    @note.update(complete: true)
    respond_to do |format|
      format.js { flash.now[:notice] = 'Note successfully archived!' }
    end
  end

  private

    def find_note
      @note = authorize(Note.find(params[:id]))
    end

    def note_params
      params.require(:note).permit(:title, :content, :task)
    end
end
