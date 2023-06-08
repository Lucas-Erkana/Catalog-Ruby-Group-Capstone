require_relative '../classes/list_music_albums'

describe MusicList do
  let(:music_list) { MusicList.new }

  describe '#add_music_album' do
    context 'when adding a music album' do
      before do
        allow(music_list).to receive(:gets).and_return("2023-06-01\n", "t\n", "Rock\n")
      end

      it 'adds a music album to the list' do
        expect { music_list.add_music_album }.to change { music_list.albums.size }.by(1)
      end

      it 'adds a genre to the list' do
        expect { music_list.add_music_album }.to change { music_list.genres.size }.by(1)
      end
    end
  end
end
