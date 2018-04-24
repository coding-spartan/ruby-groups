class GroupsController < ApplicationController

def allgroups
    @groups = Group.all
    @user = User.find(current_user.id)
end


def newgroup
    @group = User.find(current_user.id).groups.new(group_params)
    unless @group.save
        flash[:errors] = @group.errors.full_messages
    end
    redirect_to "/users/#{current_user.id}/allgroups"
end

def group_info
    @current_group = Group.find(params[:group_id])
end

def join
    User.find(current_user.id).joins.create(group:Group.find(params[:group_id]))
    redirect_to "/groups/#{params[:group_id]}/group_info"
end

def leave
    User.find(current_user.id).joins.find_by(group:Group.find(params[:group_id])).destroy
    redirect_to "/groups/#{params[:group_id]}/group_info"
end

def delete
    @current_group = Group.find(params[:group_id])
    @current_group.destroy
    redirect_to "/users/#{current_user.id}/allgroups"
end

private
def group_params
    params.require(:group).permit(:group_name, :description)
end  


end