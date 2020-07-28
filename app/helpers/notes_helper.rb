module NotesHelper
  def show_random_button(notes)
    notes.select(&:task).size >= 5
  end

  def random_task(notes)
    notes.where(task: true).order(:created_at).limit(5).sample
  end
end
