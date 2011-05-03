# Filename: RAILS_ROOT/lib/paperclip/thumbnail_with_dimensions.rb
# Required Configuration in the model
#   has_attached_file :image,
#    :styles => {
#      :thumbnail => {
#        :geometry => "100x100>",
#        :processors => [:thumbnail_with_dimensions],
#        :style_name => :thumbnail
#      },
#      :some_other_style => {
#        :geometry => "640x480>",
#        :processors => [:thumbnail_with_dimensions],
#        :style_name => :some_other_style
#      }
#    }
#
# NOTE: Since the name of the style isn't available in the processor we need to pass it in using a configuration variable.
# I've called it :style_name just to make sure I don't step on anything in the core.
#
# To get a dimension in a view just do:
# <%= @object.image.dimensions(:thumbnail) %> # Gives the "#{width}x#{height}" of the thumbnail
# <%= @object.image.dimensions %> Will return the dimensions of the original image


module Paperclip

  class Attachment

    def dimensions(style=:original)
      instance_read("#{style}_dimensions")
    end

  end

end

module Paperclip

  class ThumbnailWithDimensions < Thumbnail

    def initialize file, options = {}, attachment = nil
      super
      @style_name = options[:style_name]
      @dimensions = attachment.dimensions
    end

    def make
      dst = super


      attachment.instance_write("original_dimensions", @current_geometry.to_s) if @dimensions.blank?
      attachment.instance_write("#{@style_name}_dimensions", Geometry.from_file(dst).to_s)

      return dst
    end

  end

end
