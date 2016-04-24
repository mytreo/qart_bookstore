module BooksHelper

  def authors_to_s(authors)
    str = authors.map{|a| "#{a.name}"}.join(", ")
    if str.blank?
      'Without Author'
    else
      str
    end
  end

end
