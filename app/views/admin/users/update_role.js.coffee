$("#<%= j @user.id.to_s %>")
  .html("<%= j render partial: 'role_button', locals: { user: @user } %>")
