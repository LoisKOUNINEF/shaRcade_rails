class UserMailer < ApplicationMailer
default from: 'no-reply@monsite.fr'
def welcome_email(user)

@user = user

@url = 'http://monsite.fr/login'

destinataire et sujet.
mail(to: @user.email, subject: 'Bienvenue chez nous !')
end
end
