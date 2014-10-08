require "sprockets/helpers/magento/version"

module Sprockets
  module Helpers
    module Magento
      # Your code goes here...
      ::Sass::Script::Functions.send :include, self


      def glyphs
        if @glyphs.nil?
          fc_index_path = @options[:custom][:sprockets_context].environment.find_asset 'fontcustom_index.json'
          return Hash.new if fc_index_path.nil?
          @glyphs = JSON.load(File.new(fc_index_path))
        end
        @glyphs
      end

      def glyph(code)
        str = glyphs[code.to_s] ? "'\\#{glyphs[code.to_s]}'" : ''
        ::Sass::Script::String.new(str)
      end
    end
  end
end
module Sprockets::Helpers
  include Sprockets::Helpers::Magento
end
