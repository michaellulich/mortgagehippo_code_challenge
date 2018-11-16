class UserMailer < ApplicationMailer
  default from: "mortgagehippo@email.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.low_coin.subject
  #
  def low_coin(user, current_coin_count, current_total)
    @user = user
    @current_coin_count = current_coin_count
    @current_total = current_total


    mail to: user.email, subject: "Coin Count Low"
  end
end
