class CampaignsController < ApplicationController

	helper_method :sort_column, :sort_direction
	
	require 'will_paginate' 

  def index
		@campaigns = Campaign.paginate(:page => params[:page],
																	 :per_page => 10,
																	 :order => sort_column + " " + sort_direction)
  end

  def show
		begin
			@campaign = Campaign.find(params[:id])
			@planning = @campaign.planning
			@owner = @campaign.people.find_by_role("Owner")
  	rescue ActiveRecord::RecordNotFound
			flash[:error] = "Couldn't find campaign with id=#{params[:id]}, sorry."
			redirect_to root_path
		end
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
			redirect_to new_campaign_person_path(@campaign.id) if action_name != "edit"
		else
			render 'new'
		end
  end

  def edit
		begin
			@campaign = Campaign.find(params[:id])
			@planning = @campaign.planning
  	rescue ActiveRecord::RecordNotFound
			flash[:error] = "Couldn't edit campaign with id=#{params[:id]}, sorry."
			redirect_to root_path
		end  
	end

  def update
		@campaign = Campaign.find(params[:id])
		@planning = @campaign.planning
		if @campaign.update_attributes(params[:campaign]) &&
		(@planning.update_attributes(params[:planning]) if !@campaign.planning.nil?)
			flash[:success] = "Campaign information was successfully updated."
			redirect_to root_path
		else
			render 'edit'
		end
  end

  def destroy
		@campaign = Campaign.find(params[:id]).destroy
		flash[:success] = "Campaign was successfully deleted!"
		redirect_to root_path
  end

	def clone_campaign
		begin
			@existing_campaign = Campaign.find(params[:id])
			@existing_planning = @existing_campaign.planning

			@existing_campaign.name += " (copy)"

			@campaign = @existing_campaign.clone
			@planning = @existing_planning.clone
  	rescue ActiveRecord::RecordNotFound
			flash[:error] = "Couldn't clone campaign with id=#{params[:id]}, sorry."
			redirect_to root_path
		end
	end

	private

		def sort_column
			Campaign.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
		end

		def sort_direction
			%w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
		end
end
