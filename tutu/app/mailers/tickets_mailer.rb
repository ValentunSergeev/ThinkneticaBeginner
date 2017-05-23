class TicketsMailer < ApplicationMailer
  def buy_ticket(user, ticket)
    @user = user
    @ticket = ticket

    mail(to: @user.email, subject: I18n.t('ticket.buy.subject'))
  end

  def delete_ticket(user, ticket)
    @user = user
    @ticket = ticket

    mail(to: @user.email, subject: I18n.t('ticket.delete.subject'))
  end
end
