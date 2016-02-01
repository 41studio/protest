module CasesHelper
  def row_case_status(c)
    row_class = if c.latest_status.eql? "Failed"
      "danger"
    elsif c.latest_status.eql? "Done"
      "success"
    else
      ""
    end
  end
end
