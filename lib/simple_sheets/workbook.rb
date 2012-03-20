module SimpleSheets

  class Workbook < Tag
    self.open_tag =  [
                      '<?xml version="1.0"?>',
                      '<?mso-application progid="Excel.Sheet"?>',
                      '<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"',
                      ' xmlns:o="urn:schemas-microsoft-com:office:office"',
                      ' xmlns:x="urn:schemas-microsoft-com:office:excel"',
                      ' xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"',
                      ' xmlns:html="http://www.w3.org/TR/REC-html40">',
                     ].join("\n")
    self.close_tag = "</Workbook>"


    def initialize(fh)
      @worksheets = 0
      @worksheet_names = Hash.new
      super
    end

    def uniq_name(name)
      n = 0
      name_prefix = name
      while @worksheet_names.has_key?(name.to_s.downcase)
        n += 1
        name = "#{name_prefix} (#{n})"
      end

      name
    end

    def add_worksheet(name = "Table #{@worksheets + 1}")
      @worksheets += 1

      name = uniq_name(name)
      @worksheet_names[name.to_s.downcase] = @worksheets

      Worksheet.new(@fh, name){|ws| yield ws if block_given?}
    end
  end

end
