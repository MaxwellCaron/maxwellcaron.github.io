Jekyll::Hooks.register :documents, :pre_render do |document|
  if [".md", ".markdown", ".html"].include? document.extname
    puts "Processing file: #{document.relative_path}"  # Add this line for debugging
    image_base_path = "/assets/images/"

    document.content = document.content.gsub(/!\[\[([^\]]+)\]\]/) do |match|
      image_name = Regexp.last_match(1)
      "![](" + image_base_path + image_name + ")"
    end
  end
end
# _plugins/image_format_converter.rb
# puts "ImageFormatConverter plugin loaded!"  # This should print when the server starts
#
# module Jekyll
#   module ImageFormatConverter
#     def convert_image_format(input)
#       # Debugging: Check if method is called
#       puts "DEBUG: convert_image_format method triggered with input: #{input}"
#
#       # Apply regex to convert the image format
#       input.gsub(/!\[\[Pasted image (\d{14})\.png\]\]/) do |match|
#         "![image](/assets/img/Pasted image #{$1}.png)"
#       end
#     end
#   end
# end
#
# Liquid::Template.register_filter(Jekyll::ImageFormatConverter)




