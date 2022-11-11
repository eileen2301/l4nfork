module Admin
  class LanPartiesController < AdminController
    add_breadcrumb _('Admin|LanParties'), :admin_lan_parties_path

    def index
      op Operations::Admin::LanParty::Index
    end

    def show
      op Operations::Admin::LanParty::Load
      add_breadcrumb model.name
    end

    def new
      op Operations::Admin::LanParty::Create
      add_breadcrumb _('Admin|LanParty|New')
    end

    def create
      if run Operations::Admin::LanParty::Create
        flash[:success] = _('Admin|LanParty|Successfully created')
        redirect_to admin_lan_party_path(model)
      else
        add_breadcrumb _('Admin|LanParty|New')
        flash[:danger] = _('Admin|LanParty|Create failed')
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      op Operations::Admin::LanParty::Update
      add_breadcrumb model.name
    end

    def update
      if run Operations::Admin::LanParty::Update
        flash[:success] = _('Admin|LanParty|Successfully updated')
        redirect_to admin_lan_party_path(model)
      else
        add_breadcrumb model.name
        flash[:danger] = _('Admin|LanParty|Edit failed')
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      if run Operations::Admin::LanParty::Destroy
        flash[:success] = _('Admin|LanParty|Successfully deleted')
        redirect_to admin_lan_parties_path
      else
        flash[:danger] = _('Admin|LanParty|Cannot be deleted')
        redirect_to admin_lan_party_path(model)
      end
    rescue ActiveRecord::RecordNotDestroyed
      flash[:danger] = _('Admin|LanParty|Cannot be deleted')
      redirect_to admin_lan_party_path(model)
    end

    def export_seat_assignees
      op Operations::Admin::LanParty::ExportSeatAssignees

      respond_to do |format|
        format.json { send_data op.json_data }
        format.csv { send_data op.csv_data }
      end
    end
  end
end
