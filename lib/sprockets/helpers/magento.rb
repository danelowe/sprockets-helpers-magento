require "sprockets/helpers/magento/version"

module Sprockets
  module Helpers
    module Magento
      # Your code goes here...
      ::Sass::Script::Functions.send :include, self


      def glyphs
        if @glyphs.nil?
          fc_index_path = @options[:custom][:sprockets_context].environment.find_asset 'resources/fontcustom/templates/fontcustom_index.yml'
          return Hash.new if fc_index_path.nil?
          hash = YAML.load(File.read(fc_index_path))
          @glyphs = hash['glyphs']
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
