module RecordsHelper
  def test_title(term)
    case term
    when 0
      "前記中間"
    when 1
      "前期末"
    when 2
      "後期中間"
    when 3
      "学年末"
    end
  end
end
