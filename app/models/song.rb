class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
      genre = Genre.find_or_create_by(name: name)
      self.genre = genre
    end

    def genre_name
      if self.genre
        self.genre.name
      end
    end

    def artist_name
      if self.artist
        self.artist.name
      end
    end

    def artist_name=(name)
      artist = Artist.find_or_create_by(name: name)
      self.artist = artist
    end

    def note_contents=(notes)
      notes.each do |content|
        if content.strip != ''
          self.notes.build(content: content)
        end
      end
    end

    def note_contents
      if self.notes
        self.notes.map do |note|
          note.content
        end
      end
    end

end
