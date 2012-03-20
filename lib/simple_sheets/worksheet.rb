module SimpleSheets

  class Worksheet < Tag
    self.close_tag = "</Worksheet>"

    def open_tag
      @fh.puts %{<Worksheet ss:Name="#{@name}">}
    end

    def initialize(fh, name)
      @name = name
      super(fh)
    end

    def add_table
      Table.new(@fh){|t| yield t if block_given?}
    end
  end

end
