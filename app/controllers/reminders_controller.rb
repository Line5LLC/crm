class RemindersController < ApplicationController  
  before_action :set_reminder, only: [:show, :destroy]

  def index
    @reminders = Reminder.all
    render json: @reminders
  end

  def show
  end

  def create
    @reminder = Reminder.new(reminder_params)

    if @reminder.save
      render json: @reminder
    else
      render json: @reminder.errors, status: :unprocessable_entity
    end
  end

  def update
    @reminder = Reminder.find(reminder_params[:id])

    if @reminder.update(reminder_params)
      render json: @reminder
    else
      render json: @reminder.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @reminder.destroy
      render json: @reminder
    else
      render json: { error: 'Failed to delete reminder' }, status: :unprocessable_entity
    end
  end

  private

  def set_reminder
    @reminder = Reminder.find(params[:id])
  end

  def reminder_params
    params.require(:reminder).permit(:date, :type, :status, :lead_id, :id)
  end
end