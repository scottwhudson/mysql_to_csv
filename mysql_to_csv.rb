require 'csv'
require 'sequel'
require 'pry'
require 'mysql2'
require 'mysql'
require_relative 'database'
require_relative 'queries'


class MysqlToCSV

  def initialize(query, db, filename='mysql_query')
    @query = Object.const_get(query.upcase)
    @db_handle = Object.const_get(db.upcase)
    @filename = filename
  end

  def generate_csv
    puts "generating #{@filename}.csv"

    CSV.open("csv/#{@filename}.csv", "w") do |csv|

      rows = fetch_data
      csv << headers(rows)

      rows.each do |r|
        csv << r.values
      end
    end
  end

  private

  def fetch_data
    @db_handle.fetch(@query).all
  end

  def headers(rows)
    rows.first.keys
  end
end
