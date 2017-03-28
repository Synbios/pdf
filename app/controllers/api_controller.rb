class ApiController < ApplicationController
  # before_action :set_itinerary, only: [:show, :calendar]
  protect_from_forgery with: :null_session

  def cv
    if params[:data].blank?
      render text: "Sorry the data is corrupted, please try again."
    else
      begin
        @data = JSON.parse Base64.decode64(params[:data])
        @data.symbolize_keys!

        tex_content = render_to_string("cv.tex", layout: false)
        
        tex_file_name = "./tmp/member_#{ @data[:user_id] }_cv.tex"
        File.open(tex_file_name, 'w') do |f|
          f.puts tex_content
        end
        
        result = `pdflatex -halt-on-error -output-directory=tmp #{ tex_file_name }`
        output_file_name = "./tmp/member_#{ @data[:user_id] }_cv.pdf"
        send_file output_file_name, type: "application/pdf", disposition: 'inline'  

      rescue
        render text: "Sorry there's an error processing the PDF file. Please try again."
      end
      
    end

    
  end

  private

end
