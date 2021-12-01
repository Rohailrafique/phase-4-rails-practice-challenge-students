class StudentsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid_error
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_error

    def create
        student = Student.create!(student_params)
        render json: student, status: :created 
    end

    def index
        students = Student.all
        render json: students, status: :ok
    end

    def update
        student = Student.find(params[:id])
        student.update(student_params)
        render json:  student, status: :ok 
    end

    def destroy
        student = Student.find(params[:id])
        student.destroy 
        render json: {}, status: :ok 
    end

    private

    def student_params
        params.permit(:name, :age, :major, :instructor_id)
    end

    def record_invalid_error(exception)
        render json: {errors: exception.record.errors.full_messages}
    end

    def record_not_found_error
        render json: {errors: "student not found"}
    end
end
