class StudentController < ApplicationController
  before_action :sign_in_required, only: [:index]
  before_action :attribute_students, only: [:index]
  before_action :attribute_student, only: [:edit, :update]
  before_action :attribute_student_group, only: [:edit, :update]

  def index; end

  def edit; end

  def update
    attribut_next_number(group_params)
    @set_group = GroupNumberStudent.new(group_id: group_params, student_id: @student.id, number: @number + 1)
    if @set_group.save
      redirect_to student_index_path, notice: '割り当てに成功'
    else
      attribute_update_group
      if @update_group.update(group_id: group_params)
        redirect_to student_index_path, notice: '更新に成功'
      else
        redirect_to student_index_path, notice: '更新に失敗'
      end
    end
  end

  private

    def attribute_students
      @students = Student.all
    end

    def attribute_student
      @student = Student.find(params[:id])
    end

    def attribute_student_group
      @group = GroupNumberStudent.includes(:group, :student).where(student_id: @student.id)
    end

    def attribute_update_group
      @update_group = GroupNumberStudent.find_by(student_id: @student.id)
    end

    def attribut_next_number(group_id)
      @number = GroupNumberStudent.where(group_id: group_id).order("number DESC").count
    end

    def group_params
      @id = params.require(:student).permit(:group_id)
      @id = @id["group_id"]
    end
end
