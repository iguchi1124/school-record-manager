$("#<%= j @user.id.to_s %>")
  .html("<%= j render 'role_button' %>")
