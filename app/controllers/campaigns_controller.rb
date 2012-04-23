class CampaignsController < ApplicationController
  def index
		@campaigns = Campaign.all
  end

  def show
  end

  def new
		@campaign = Campaign.new
		@campaign.build_planning
  end

  def create
		@campaign = Campaign.new(params[:campaign])
		@campaign.build_planning(params[:planning])
		if @campaign.save
			flash[:notice] = "Gotcha!"
		else
			flash[:error] = "Goddammit!"
		end
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
