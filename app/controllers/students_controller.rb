class StudentsController < ApplicationController


    def index
        students = Student.all
        render json: students, status: 200
    end

    def create
        student = Student.create(student_params)
        render json: student, status: 201, include: ['instructor']
    end

    def update
        student = find_by_id
        if student
            student.update(student_params)
            render json: student, status: 202, include: ['instructor']
        else
            student_404
        end
    end

    def destroy
        student = find_by_id
        if student
            student.destroy
            render json: student, status: 202
        else
            student_404
        end
    end

    private

    def find_by_id
        student = Student.find_by(id: params[:id])
    end

    def student_params
        params.permit(:name, :age, :major, :instructor_id)
    end

    def student_404
        render json: { error: "No student found" }, status: 404
    end

end
