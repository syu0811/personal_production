class Admin::GroupController < ApplicationController
  before_action :authenticate_admin!, only: [:index]
  before_action :attribute_groups, only: [:index]
  before_action :attribute_group, only: [:edit, :update, :destroy]

  def index; end

  def edit; end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to admin_group_index_path, notice: '作成に成功'
    else
      render :new
    end
  end

  def update
    if @group.update(group_params)
      redirect_to admin_group_index_path, notice: '更新に成功'
    else
      render :edit
    end
  end

  def destroy
    @group.destroy!
    redirect_to admin_group_index_path, notice: '削除に成功'
  end

  private

    def attribute_groups
      @groups = Group.all
    end

    def attribute_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:school_year, :number, :user_id)
    end
end
