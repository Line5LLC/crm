class RemindersController < ApplicationController  
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
    end
  
    # POST /reminders
    def create
      @reminder = Reminder.new(reminder_params)
  
      if @reminder.save
        redirect_to reminders_path, notice: 'Reminder was successfully created.'
      else
        render :new
      end
    end
  
    # GET /reminders/:id/edit
    def edit
    end
  
    # PATCH/PUT /reminders/:id
    def update
      if @reminder.update(reminder_params)
        redirect_to reminders_path, notice: 'Reminder was successfully updated.'
      else
        render :edit
      end
    end
  
    # DELETE /reminders/:id
    def destroy
      @reminder.destroy
      redirect_to reminders_path, notice: 'Reminder was successfully deleted.'
    end
  
    private
  
    def set_reminder
      @reminder = Reminder.find(params[:id])
    end
  
    def reminder_params
      params.require(:reminder).permit(:lead_id, :date, :type, :status)
    end
  end