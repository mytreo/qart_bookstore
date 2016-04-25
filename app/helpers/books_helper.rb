module BooksHelper

  def authors_to_s(authors)
    str = authors.map{|a| link_to "#{a.name}",a }.join(", ")
    if str.blank?
      'Without Author'
    else
      sanitize(str)
    end
  end

  def short_text(text)
    if text.length > 420
      text=text[0..420]+"..."
    end
    text
  end

end
