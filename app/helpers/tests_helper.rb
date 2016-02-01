module TestsHelper
  def test_detail(test, status)
    _detail = ""
    _detail += "<strong>#{status}</strong>"
    _detail += "<br>"
    _detail += "Happy Case : #{test.get_cases_by_type_and_status("Happy Case", status).count}"
    _detail += "<br>"
    _detail += "Unhappy Case : #{test.get_cases_by_type_and_status("Unhappy Case", status).count}"
    _detail += "<br>"
    _detail += "<br>"
    return _detail.html_safe
  end

  def row_test_status(test)
    done_cases_total = test.get_cases_by_type_and_status("Happy Case", "Done").count + test.get_cases_by_type_and_status("Unhappy Case", "Done").count
    failed_cases_total = test.get_cases_by_type_and_status("Happy Case", "Failed").count + test.get_cases_by_type_and_status("Unhappy Case", "Failed").count
    new_cases_total = test.get_cases_by_type_and_status("Happy Case", "New").count + test.get_cases_by_type_and_status("Unhappy Case", "New").count

    row_class = if failed_cases_total > 0
      "danger"
    elsif failed_cases_total == 0 && done_cases_total > 0 && new_cases_total == 0
      "success"
    elsif failed_cases_total == 0 && done_cases_total > 0 && new_cases_total > 0
      "warning"
    elsif failed_cases_total == 0 && done_cases_total == 0
      ""
    end
  end
end
