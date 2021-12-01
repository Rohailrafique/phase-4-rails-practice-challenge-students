class InstructorsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :record_invalid_error
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_error

    def create
        instructor = Instructor.create!(instructor_params)
        render json: instructor, status: :created 
    end

    def index
        instructors = Instructor.all
        render json: instructors, status: :ok
    end

    def update
        instructor = Instructor.find(params[:id])
        instructor.update(instructor_params)
        render json:  instructor, status: :ok 
    end

    def destroy
        instructor = Instructor.find(params[:id])
        instructor.destroy 
        render json: {}, status: :ok 
    end

    private

    def instructor_params
        params.permit(:name)
    end

    def record_invalid_error(exception)
        render json: {errors: exception.record.errors.full_messages}
    end

    def record_not_found_error
        render json: {errors: "instructor not found"}
    end

end
