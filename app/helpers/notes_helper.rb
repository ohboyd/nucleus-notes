module NotesHelper
  def show_random_button(notes)
    notes.select(&:task).size >= 5
  end
end
