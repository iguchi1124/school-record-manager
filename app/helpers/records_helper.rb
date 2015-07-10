module RecordsHelper
  def test_title(term)
    case term
    when 1
      "前記中間"
    when 2
      "前期末"
    when 3
      "後期中間"
    when 4
      "学年末"
    end
  end
end
