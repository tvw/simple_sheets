module SimpleSheets

  class Data
    def initialize(fh, content = nil)
      @content = content
      fh.puts "<Data#{type}>#{@content}</Data>"
    end

    def type
      return ' ss:Type="Number"' if @content.is_a?(Fixnum) or @content.is_a?(Float)
      ' ss:Type="String"'
    end
  end

end
