module ApplicationHelper
  # escape special characters to make the string safe in LaTex script
  def escaple_latex(str)
    if str.blank?
      ""
    else
      str.gsub(/([\&\#\_\%\$\_\{\}\~\^\\])/,"\\\\\\1")
    end
  end

  def reformat_wrapped(s, width=16)
    lines = []
    line = ""
    s.split(/\s+/).each do |word|
      if line.size + word.size >= width
        lines << line
        line = word
      elsif line.empty?
       line = word
      else
       line << " " << word
     end
     end
     lines << line if line
    lines
  end

  def bf(str)
    strs = reformat_wrapped(str)
    strs.map { |s| "\\textbf{#{s}}" }.join(" ")
  end
end
