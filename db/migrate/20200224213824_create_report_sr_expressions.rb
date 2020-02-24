class CreateReportSrExpressions < ActiveRecord::Migration[5.1]
  def change
    create_view :report_sr_expressions
  end
end
