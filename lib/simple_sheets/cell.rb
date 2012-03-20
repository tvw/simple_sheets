module SimpleSheets

  class Cell < Tag
    self.open_tag = "<Cell>"
    self.close_tag = "</Cell>"

    def add_data(content = nil)
      Data.new(@fh, content)
    end
  end

end
