class Separator

  def words(string)
    if (/^\d+$/).match(string)
      return nil
    else
      string.scan(/\w*\S\-\w*|\w*\S/)
    end
  end

  def phone_number(number)
    phone_number = /.*(\d{3}).*[ -.]*(\d{3})[ -.]*(\d{4})/.match(number)
      return nil if phone_number.nil?
      { area_code: phone_number[1], number: phone_number[2]+ "-" +phone_number[3] }
  end

  def money(input)
      if /^$/.match(input) || /^.$/.match(input) || /^\d*$/.match(input)
        return nil
      elsif /[.]\d{1}$/.match(input) || /[.]\d{3}$/.match(input)
        return nil
      elsif !input.include? (',')
      amount = /(.{1})(\d*[.,]*\d*)/.match(input)
      { currency: amount[1], amount: amount[2].to_f }
    elsif /^(.{1})(\d{2})[,]*(\d{2})$/.match(input)
        return nil
      else
        commas = input.scan(/[,]/)
        if commas.length == 1
          amount = /(.{1})(\d*)[.,]*(\d*)/.match(input)
          { currency: amount[1], amount: (amount[2]+amount[3]).to_f }
        elsif commas.length == 2
          amount = /(.{1})(\d*)[.,]*(\d*)[.,]*(\d*[.,]*\d*)/.match(input)
          { currency: amount[1], amount: (amount[2]+amount[3]+amount[4]).to_f }
        end
      end
  end

end
