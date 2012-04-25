class PeopleController < ApplicationController

	def index
		begin
			@campaign = Campaign.find(params[:campaign_id])
			@people = @campaign.people.paginate(:page => params[:page], :per_page => 9)
		rescue ActiveRecord::RecordNotFound
			flash[:error] = "Couldn't find campaign with id=#{params[:campaign_id]}, sorry."
			redirect_to root_path
		end
	end

	def show
		@campaign = Campaign.find(params[:campaign_id])
		@person = @campaign.people.find(params[:id])
	end

  def new
		begin
			@campaign = Campaign.find(params[:campaign_id])
			@store_id = @campaign.id
			@person = @campaign.people.build
  	rescue ActiveRecord::RecordNotFound
			flash[:error] = "Couldn't find campaign with id=#{params[:campaign_id]}, sorry."
			redirect_to root_path
		end
	end

  def create
		@campaign = Campaign.find(params[:campaign_id])
		@person = @campaign.people.build(params[:person])
		if @person.save
			flash[:success] = "New participant was added."
			redirect_to @campaign
		else
			render 'new'
		end
  end

	def destroy
		@campaign = Campaign.find(params[:campaign_id])
		@person = @campaign.people.find(params[:id]).destroy
		redirect_to campaign_people_path(@campaign.id)
	end

end
