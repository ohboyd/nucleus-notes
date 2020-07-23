require 'rails_helper'

RSpec.describe Note, type: :model do
  let(:user) { create :user }
  let(:blank_note) { build :note, title: nil, content: nil, user_id: user.id }
  let(:note_with_content) { build :note, title: nil, content: "foo bar", user_id: user.id }
  subject { described_class.new(title: 'A string under 30 characters', user_id: user.id) }

  describe 'validations' do
    context 'when validating presence' do
      it 'is valid with all attributes' do
        expect(subject).to be_valid
      end

      it 'is invalid if missing a title and content' do
        expect(blank_note).not_to be_valid
      end

      it 'is valid if has either a title or content' do
        expect(note_with_content).to be_valid
      end
    end

    context 'when validating length' do
      it 'is valid if the title is shorter than thirty characters' do
        subject.title = "Less than 30 characters"
        expect(subject).to be_valid
      end

      it 'is valid if the title is shorter than thirty characters' do
        subject.title = "A few more than 30 characters long"
        expect(subject).not_to be_valid
      end

      it 'is valid when content has fewer than 1000 characters' do
        subject.content = Faker::Hipster.paragraph_by_chars(characters: 950)
        expect(subject).to be_valid
      end

      it 'is invalid when content has more than 1000 characters' do
        subject.content = Faker::Hipster.paragraph_by_chars(characters: 1001)
        expect(subject).not_to be_valid
      end
    end
  end

  describe 'creating a note' do
    let!(:note_with_content_but_no_title) { create :note, title: '', user_id: user.id }
    context 'when there is no title, but content is present' do
      it 'sets the title to the first 30 characters of the content' do
        expect(note_with_content_but_no_title.title).to eq note_with_content_but_no_title.content.to_plain_text[0...30]
      end
    end
  end
end
