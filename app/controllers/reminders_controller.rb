class RemindersController < ApplicationController  
  before_action :set_reminder, only: [:show, :edit, :update, :destroy]

  # GET /reminders
  def index
    @reminders = Reminder.all
  end

  # GET /reminders/:id
  def show
  end

  # GET /reminders/new
  def new
    @reminder = Reminder.new
    # Assuming you want to select a lead for the reminder
    @leads = Lead.all
  end

  # POST /reminders
  def create
    @reminder = Reminder.new(reminder_params)

    if @reminder.save
      redirect_to reminder_path(@reminder), notice: 'Reminder was successfully created.'
    else
      # If save fails, render the new form again with errors
      render :new
    end
  end

  # GET /reminders/:id/edit
  def edit
    @lead = Lead.find(params[:id])
    @lead.reminders.build  # Build a new reminder associated with the lead
  end

  def update
    @lead = Lead.find(params[:id])

    if @lead.update(lead_params)
      # Handle successful update
    else
      # Handle validation errors
    end
  end

  # DELETE /reminders/:id
  def destroy
    @reminder.destroy
    redirect_to reminders_path, notice: 'Reminder was successfully deleted.'
  end

  private

  # Use a before_action callback to find the reminder by ID
  def set_reminder
    @reminder = Reminder.find(params[:id])
  end

  # Strong parameters to sanitize and permit only the required fields
  def reminder_params
    params.require(:reminder).permit(:lead_id, :date, :type, :status)
  end
end