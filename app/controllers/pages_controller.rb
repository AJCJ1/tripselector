class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @sea_1 = Journey.all.find_by_name("Tour of Britany")
    @sea_2 = Journey.all.find_by_name("French Islands")
    @sea_3 = Journey.all.find_by_name("Surfing USA")
    @mountain_1 = Journey.all.find_by_name("Food and kayak")
    @mountain_2 = Journey.all.find_by_name("Take me down to paradise city")
    @mountain_3 = Journey.all.find_by_name("Rumble in Grenoble")
    @major_city_1 = Journey.all.find_by_name("No time to lose")
    @major_city_2 = Journey.all.find_by_name("Can French people be nice?")
    @major_city_3 = Journey.all.find_by_name("You're Lyon to me")
    @food_1 = Journey.all.find_by_name("Girls, just wanna eat duck")
    @food_2 = Journey.all.find_by_name("Marseille bébé")
    @food_3 = Journey.all.find_by_name("Feels like home")
  end

  def dashboard
    # show future journeys
    @journeys = current_user.journeys.sort_by(&:start_date)
    @current_journey = []
    @journeys.each do |journey|
      if journey.start_date <= Date.today && journey.end_date >= Date.today
        @current_journey << journey
      end
    end
  end

  def dashboard_current
    # show current journeys
    @journeys = current_user.journeys.sort_by(&:start_date)
    @current_journey = []
    @journeys.each do |journey|
      if journey.start_date <= Date.today && journey.end_date >= Date.today
        @current_journey << journey
      end
    end
  end

  def dashboard_past
    # show past journeys
    @journeys = current_user.journeys.sort_by(&:start_date)
    @current_journey = []
    @journeys.each do |journey|
      if journey.start_date <= Date.today && journey.end_date >= Date.today
        @current_journey << journey
      end
    end
  end

  def profile
    @user = current_user
  end
end
