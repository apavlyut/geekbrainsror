module TicketsHelper
  def ticket_class(ticket)
    if ticket.opened?
      'card-success'
    elsif ticket.closed?
      'card-info'
    elsif ticket.rejected?
      'card-danger'
    end
  end
end
