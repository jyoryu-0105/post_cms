require 'csv'

CSV.generate do |csv|
  column_names = %w(title first_keyword second_keyword third_keyword fourth_keyword fifth_keyword words price)
  csv << column_names
end