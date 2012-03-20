module SimpleSheets

  class Tag
    def self.open_tag
      @open_tag
    end

    def self.open_tag=(str)
      @open_tag = str
    end

    def self.close_tag=(str)
      @close_tag = str
    end

    def self.close_tag
      @close_tag
    end

    def open_tag
      @fh.puts self.class.open_tag if self.class.open_tag
    end

    def close_tag
      @fh.puts self.class.close_tag if self.class.close_tag
    end

    def initialize(fh)
      @fh = fh
      open_tag
      yield self if block_given?
      close_tag
    end
  end

end
