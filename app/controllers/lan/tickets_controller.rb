module Lan
  class TicketsController < LanController
    def assign
      if run Operations::Ticket::AssignToUser
        flash[:success] = _('Ticket|Successfully assigned')
      else
        flash[:danger] = _('Ticket|Could not be assigned')
      end

      respond_to do |format|
        format.turbo_stream
      end
    rescue Operations::Exceptions::OpFailed => e
      flash[:danger] = e.message
      redirect_to lan_seatmap_path
    end

    def remove_assignee
      if run Operations::Ticket::RemoveAssignee
        flash[:success] = _('Ticket|Successfully removed assignee')
      else
        flash[:danger] = _('Ticket|Assignee could not be removed')
      end

      respond_to do |format|
        format.turbo_stream
      end
    rescue Operations::Exceptions::OpFailed => e
      flash[:danger] = e.message
      redirect_to lan_seatmap_path
    end

    def take_seat
      if run Operations::Ticket::TakeSeat
        flash[:success] = _('Ticket|Successfully taken seat')
      else
        flash[:danger] = _('Ticket|Seat could not be taken')
      end

      respond_to do |format|
        format.turbo_stream
      end
    rescue Operations::Exceptions::OpFailed => e
      flash[:danger] = e.message
      redirect_to lan_seatmap_path
    end

    def remove_seat
      if run Operations::Ticket::RemoveSeat
        flash[:success] = _('Ticket|Successfully removed seat')
      else
        flash[:danger] = _('Ticket|Seat could not be removed')
      end

      respond_to do |format|
        format.turbo_stream
      end
    rescue Operations::Exceptions::OpFailed => e
      flash[:danger] = e.message
      redirect_to lan_seatmap_path
    end
  end
end
