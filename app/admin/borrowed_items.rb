ActiveAdmin.register BorrowedItem do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :item_id, :status, :borrowers_name, :borrowers_student_number,:borrowers_course,:borrowers_year_and_level,:is_returned
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
