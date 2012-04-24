class CampaignsController < ApplicationController
	helper_method :sort_column, :sort_direction

  def index
		@campaigns = Campaign.all(:order => sort_column + " " + sort_direction)
  end

  def show
		@campaign = Campaign.find(params[:id])
		@planning = @campaign.planning
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
		@campaign = Campaign.find(params[:id]).destroy
		flash[:success] = "Campaign was successfully deleted!"
		redirect_to root_path
  end

	private

		def sort_column
			Campaign.column_names.include?(params[:sort]) ? params[:sort] : "name"
		end

		def sort_direction
			%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
		end
end
