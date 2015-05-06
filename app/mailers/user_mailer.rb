class UserMailer < ApplicationMailer
      default from: "mikelnpacheco.com"

      def confirmation_email(user)
          @user = user
          mail(to: @user.email, subject: "Thanks for your order")
      end    
end
