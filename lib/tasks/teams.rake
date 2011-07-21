require "csv"

namespace :import do

  desc "Import Teams into DB from a CSV File."
  task :teams => :environment do
    puts "Clearing Old Teams..."
    Team.destroy_all
    Pick.destroy_all
    puts "Reading from teams.csv..."
    CSV.foreach('teams.csv') do |row|
      row.each do |team_record|
        puts "ROW: #{row.to_s}"
        begin
          t = team_record.split(',')
          school_name = t[0].lstrip
          short_name = t[1].lstrip
          mascot = t[2].lstrip
          wins = t[3].lstrip.to_i
          new_team = Team.create(:name => school_name, :short_name => short_name, :mascot => mascot)
          new_team.records.create(:period_id => Period.find_or_create_by_year('2010'), :wins => wins)
        rescue 
          puts "Unable to import team."
        end  
      end  
    end
  end
end
