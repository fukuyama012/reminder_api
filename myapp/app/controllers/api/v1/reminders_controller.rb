module Api
  module V1
    class RemindersController < ApplicationController
      before_action :set_reminder, only: [:show, :update, :destroy]

      # GET /reminders
      def index
        @reminders = Reminder.all

        render json: @reminders
      end

      # GET /reminders/1
      def show
        render json: @reminder
      end

      # POST /reminders
      def create
        @reminder = Reminder.new(reminder_params)

        if @reminder.save
          render json: @reminder, status: :created
        else
          render json: @reminder.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /reminders/1
      def update
        if @reminder.update(reminder_params)
          render json: @reminder
        else
          render json: @reminder.errors, status: :unprocessable_entity
        end
      end

      # DELETE /reminders/1
      def destroy
        @reminder.destroy
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_reminder
        @reminder = Reminder.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def reminder_params
        params.require(:reminder).permit(:notify, :description, :cycle_days, :category_id)
      end
    end
  end
end

