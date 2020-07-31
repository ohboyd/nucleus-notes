module NotesHelper
  def show_random_button(notes)
    notes.select(&:task).size >= 5
  end

  def random_task(notes)
    notes.unfinished.where(task: true).order(:created_at).limit(5).sample
  end

  def grab_giphy(celebrations)
    url="http://api.giphy.com/v1/gifs/search?q=#{celebrations}&api_key=#{ENV["GIPHY_API_KEY"]}&limit=1"
    resp = Net::HTTP.get_response(URI.parse(url))
    buffer = resp.body
    result = JSON.parse(buffer)
    source = result.fetch('data')[0]['embed_url']
  end
end
