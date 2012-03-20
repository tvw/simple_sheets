module SimpleSheets

  class Table < Tag
    self.open_tag = "<Table>"
    self.close_tag = "</Table>"

    def add_row
      Row.new(@fh){|r| yield r if block_given?}
    end
  end

end
