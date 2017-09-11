module Scholrax::Importer
  class HandleFileReader

    attr_reader :handle_file_path

    def initialize(handle_file_path)
      @handle_file_path = handle_file_path
    end

    def call
      if File.file?(handle_file_path)
        handle_id = File.readlines(handle_file_path).first.chomp
      end
    end

  end
end