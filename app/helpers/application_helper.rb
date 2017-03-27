module ApplicationHelper
  # escape special characters to make the string safe in LaTex script
  def escaple_latex(str)
    if str.blank?
      ""
    else
      str.gsub(/([\&\#\_])/,"\\\\\\1")
    end
  end
end
