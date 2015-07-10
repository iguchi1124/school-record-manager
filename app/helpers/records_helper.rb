module RecordsHelper
  def test_title(term)
    case term
    when 'first_term'
      "前記中間"
    when 'second_term'
      "前期末"
    when 'third_term'
      "後期中間"
    when 'fourth_term'
      "学年末"
    end
  end
end
