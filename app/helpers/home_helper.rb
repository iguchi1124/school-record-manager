module HomeHelper
  def has_klass?
    current_user.klass.present?
  end
end
