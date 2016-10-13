class Extractor
  def phone_numbers(text)
    only_phone_numbers_with_symbols = /\(\d{3}\) \d{3}\-\d{4}/
    phone_numbers = text.scan(only_phone_numbers_with_symbols)
  end

  def emails(text)
    only_email_addresses = /\w+\.\w+\@\w+\.\w*|\w+\@\w+\.\w*/
    emails = text.scan(only_email_addresses)
  end
end
