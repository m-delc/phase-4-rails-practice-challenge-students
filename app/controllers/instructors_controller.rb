class InstructorsController < ApplicationController

    def index
        instructors = Instructor.all
        render json: instructors, status: 200
    end

    def create
        instructor = Instructor.create(instructor_params)
        render json: instructor, status: 201, include: ['instructor']
    end

    def update
        instructor = find_by_id
        if instructor
            instructor.update(instructor_params)
            render json: instructor, status: 202, include: ['instructor']
        else
            instructor_404
        end
    end

    def destroy
        instructor = find_by_id
        if instructor
            instructor.destroy
            render json: {}, status: 202
        else
            instructor_404
        end
    end

    private

    def instructor_params
        params.permit(:name)
    end

    def find_by_id
        Instructor.find_by(id: params[:id])
    end

    def instructor_404
        render json: { error: "No instructor found" }, status: 404
    end



end
