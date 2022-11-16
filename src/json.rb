require './music_album'

module PreserveData
  def get_data(file)
    file_path = "./DATA/#{file}.json"
    File.new(file_path, 'w+') unless File.exist?(file_path)
    File.write(file_path, '[]') if File.empty?(file_path)
    contents = File.read(file_path)
    JSON.parse(contents)
  end

  def data_upgrade(file, data)
    opts = {
      array_nl: "\n",
      object_nl: "\n",
      indent: '  ',
      space_before: ' ',
      space: ' '
    }
    json_data = JSON.generate(data, opts)
    File.write("./DATA/#{file}.json", json_data)
  end

  def load_music_album
    get_data('music_album').map { |album| MusicAlbum.new(album['label'], album['author']) }
  end
end
