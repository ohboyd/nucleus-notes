require 'rails_helper'

RSpec.describe Note, type: :model do
  let(:user) { create :user }
  subject { described_class.new(title: 'Short string', content: 'Short string', user_id: user.id) }

  describe 'validations' do
    context 'when validating length' do
      it 'is valid if the title is shorter than thirty characters' do
        subject.title = "Less than 30 characters"
        subject.save
        expect(subject).to be_valid
      end

      it 'is valid if the title is shorter than thirty characters' do
        subject.title = "A few more than 30 characters long"
        subject.save
        expect(subject).not_to be_valid
      end

      it 'is valid when content has fewer than 1000 characters' do
        subject.content = Faker::Hipster.paragraph_by_chars(characters: 999)
        subject.save
        expect(subject).to be_valid
      end

      it 'is invalid when content has more than 1000 characters' do
        subject.content = Faker::Hipster.paragraph_by_chars(characters: 1001)
        subject.save
        expect(subject).not_to be_valid
      end
    end

    describe 'creating or updating a note' do
      let(:valid_note) { create :note, title: 'Short string', content: 'Bit longer string' }

      context 'when necessary attributes are present' do
        it 'is valid' do
          expect(valid_note).to be_valid
        end
      end

      context 'when title is blank, but content is present' do
        it 'sets the title to the first 30 characters of the content' do
          valid_note.title = ''
          valid_note.save
          expect(valid_note.title).to eq valid_note.content.to_plain_text[0...30]
        end
      end

      context 'when title is nil, but content is present' do
        it 'sets the title to the first 30 characters of the content' do
          valid_note.title = nil
          valid_note.save
          expect(valid_note.title).to eq valid_note.content.to_plain_text[0...30]
        end
      end

      context 'when title and content are blank' do
        it 'is invalid' do
          valid_note.title = ''
          valid_note.content = ''
          valid_note.save
          expect(valid_note).not_to be_valid
        end
      end

      context 'when title and content are nil' do
        it 'is invalid' do
          valid_note.title = nil
          valid_note.content = nil
          valid_note.save
          expect(valid_note).not_to be_valid
        end
      end

      context 'when title is present and content is blank' do
        it 'is valid' do
          valid_note.content = ''
          valid_note.save
          expect(valid_note).to be_valid
        end
      end

      context 'when title is present and content is nil' do
        it 'is valid' do
          valid_note.content = nil
          valid_note.save
          expect(valid_note).to be_valid
        end
      end
    end
  end
end
