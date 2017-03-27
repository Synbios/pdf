class ApiController < ApplicationController
  # before_action :set_itinerary, only: [:show, :calendar]

  def cv
    id = 1
    tex_content = render_to_string("cv.tex", layout: false)
    tex_file_name = "./tmp/member_#{id}_cv.tex"
    File.open(tex_file_name, 'w') do |f|
      f.puts tex_content
    end
    
    result = `pdflatex -halt-on-error -output-directory=tmp #{tex_file_name}`
    output_file_name = "./tmp/member_#{id}_cv.pdf"
    send_file output_file_name, type: "application/pdf", disposition: 'inline'
  end

  private

end
