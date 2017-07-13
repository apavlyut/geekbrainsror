module PhonesHelper
  def show_bingo(phone)
    if phone.to_s == '123'
      "Yaw Bingo!: #{phone}"
    else
      phone
    end
  end
end
