module SimpleSheets

  class Row < Tag
    self.open_tag = "<Row>"
    self.close_tag = "</Row>"

    def add_cell
      Cell.new(@fh){|c| yield c if block_given?}
    end
  end

end
