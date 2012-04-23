class CampaignsController < ApplicationController
  def index
		@campaigns = Campaign.all
  end

  def show
  end

  def new
		@campaign = Campaign.new
		@planning = @campaign.build_planning
  end

  def create
		@campaign = Campaign.new(params[:campaign])
		@planning = @campaign.build_planning(params[:planning])
		if @campaign.save
			flash[:success] = "New campaign was successfully created!"
			redirect_to root_path
		else
			render 'new'
			flash[:error] = "Sorry, something went wrong."
		end
  end

  def edit
		@campaign = Campaign.find(params[:id])
		@planning = @campaign.planning
  end

  def update
		@campaign = Campaign.find(params[:id])
		@planning = @campaign.planning
		if @campaign.update_attributes(params[:campaign]) &&
		(@planning.update_attributes(params[:planning]) if !@campaign.planning.nil?)
			flash[:success] = "Campaign information was successfully updated."
			redirect_to root_path
		else
			flash[:error] = "Update was unsuccessful."
		end

  end

  def destroy
  end

end
