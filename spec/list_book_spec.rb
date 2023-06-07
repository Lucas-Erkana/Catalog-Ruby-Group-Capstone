require_relative '../classes/list_book'

RSpec.describe ListBook do
  let(:list_book) { ListBook.new }

  describe '#add_book' do
    it 'adds a book to the list' do
      # Simulate user input for book details
      allow_any_instance_of(Object).to receive(:gets).and_return('Title', 'Color', '2023-06-07', 'Publisher', 'GOOD')

      expect { list_book.add_book }.to output(/Book added/).to_stdout
      expect(list_book.books.length).to eq(1)
      expect(list_book.labels.length).to eq(1)
    end
  end

  describe '#list_all_books' do
    it 'lists all the books' do
      # Create sample books
      book1 = instance_double('Book', publish_date: '2023-01-01', publisher: 'Publisher 1', cover_state: 'GOOD')
      book2 = instance_double('Book', publish_date: '2023-02-02', publisher: 'Publisher 2', cover_state: 'BAD')
      allow(list_book).to receive(:books).and_return([book1, book2])

      expect do
        list_book.list_all_books
      end.to output(/Publish date: \d{4}-\d{2}-\d{2}, Publisher: .+, Cover state: (GOOD|BAD)/).to_stdout
    end
  end

  describe '#list_all_labels' do
    it 'lists all the labels' do
      # Create sample labels
      label1 = instance_double('Label', id: 1, title: 'Label 1', color: 'Red')
      label2 = instance_double('Label', id: 2, title: 'Label 2', color: 'Blue')
      allow(list_book).to receive(:labels).and_return([label1, label2])

      expect { list_book.list_all_labels }.to output(/Title: .+, Color: (Red|Blue)/).to_stdout
    end
  end
end
