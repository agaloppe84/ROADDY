module ApplicationHelper

  def editable?
    controller.action_name == "edit" or controller.action_name == "create"
  end
end
