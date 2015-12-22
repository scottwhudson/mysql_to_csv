require_relative 'mysql_to_csv'

desc "Generates csv of results from mysql query"
task :generate_csv, [:query, :db, :filename] do |t, args|
  csv = MysqlToCSV.new(args[:query], args[:db], args[:filename])
  csv.generate_csv
end
